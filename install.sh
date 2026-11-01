#!/usr/bin/env bash
# Install the skills in this repository for Claude Code, OpenCode and Hermes Agent.
#
# Usage:
#   ./install.sh [all|claude|opencode|hermes] [options]
#   ./install.sh project <path-to-project> [options]
#   ./install.sh --list
#
# Options:
#   --category LIST  only these categories, comma-separated (e.g. security,planning or 06-security)
#   --copy           copy files instead of symlinking (symlinks update with `git pull`)
#   --force          replace existing skills that have the same name
#   --list           show all categories and skills, then exit
#
# "project" copies into <project>/.claude/skills, which Claude Code and OpenCode both read.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS="$ROOT/skills"

usage() { sed -n '2,16p' "$0" | sed 's/^# \{0,1\}//'; }

target=""; project=""; mode="link"; force=0; categories=""; list=0
while [ $# -gt 0 ]; do
  case "$1" in
    --copy)     mode="copy" ;;
    --force)    force=1 ;;
    --list)     list=1 ;;
    --category) [ $# -ge 2 ] || { echo "--category needs a value" >&2; exit 1; }
                categories="$2"; shift ;;
    --category=*) categories="${1#--category=}" ;;
    -h|--help)  usage; exit 0 ;;
    -*)         echo "Unknown option: $1" >&2; usage >&2; exit 1 ;;
    *)
      if   [ -z "$target" ];  then target="$1"
      elif [ -z "$project" ]; then project="$1"
      else echo "Too many arguments" >&2; usage >&2; exit 1; fi ;;
  esac
  shift
done
target="${target:-all}"

# category_selected <folder>: true when no filter is set or the folder matches one entry
category_selected() {
  local folder="$1" short="${1#[0-9][0-9]-}" wanted
  [ -z "$categories" ] && return 0
  for wanted in $(echo "$categories" | tr ',' ' '); do
    [ "$wanted" = "$folder" ] || [ "$wanted" = "$short" ] && return 0
  done
  return 1
}

if [ "$list" -eq 1 ]; then
  for cat_dir in "$SKILLS"/*/; do
    cat_dir="${cat_dir%/}"; category="$(basename "$cat_dir")"
    category_selected "$category" || continue
    echo "$category"
    for dir in "$cat_dir"/*/; do [ -f "$dir/SKILL.md" ] && echo "  - $(basename "$dir")"; done
  done
  exit 0
fi

matched=0
# place <src-dir> <out-path>: install one skill, never clobbering unless --force
place() {
  local dir="$1" out="$2" name
  name="$(basename "$dir")"
  if [ -e "$out" ] || [ -L "$out" ]; then
    if [ "$mode" = "link" ] && [ -L "$out" ] && [ "$(readlink "$out")" = "$dir" ]; then
      echo "  = $name (already installed)"; return
    fi
    if [ "$force" -ne 1 ]; then
      echo "  ! $name skipped: $out already exists (use --force to replace)"; return
    fi
    rm -rf "$out"
  fi
  mkdir -p "$(dirname "$out")"
  if [ "$mode" = "copy" ]; then cp -R "$dir" "$out"; else ln -s "$dir" "$out"; fi
  echo "  + $name"
}

# install_flat <dest>: Claude Code and OpenCode want <dest>/<skill-name>/SKILL.md
install_flat() {
  local dest="$1" dir category
  for dir in "$SKILLS"/*/*/; do
    dir="${dir%/}"; [ -f "$dir/SKILL.md" ] || continue
    category="$(basename "$(dirname "$dir")")"
    category_selected "$category" || continue
    matched=1
    place "$dir" "$dest/$(basename "$dir")"
  done
}

# install_hermes <root>: Hermes groups skills as <root>/<category>/<skill-name>/SKILL.md
install_hermes() {
  local root="$1" dir category name out other
  for dir in "$SKILLS"/*/*/; do
    dir="${dir%/}"; [ -f "$dir/SKILL.md" ] || continue
    category="$(basename "$(dirname "$dir")")"
    category_selected "$category" || continue
    matched=1
    name="$(basename "$dir")"; out="$root/${category#[0-9][0-9]-}/$name"
    # a skill with the same name in another Hermes category (e.g. a bundled one) wins
    other="$(find "$root" -mindepth 2 -maxdepth 2 -name "$name" 2>/dev/null | grep -vxF "$out" | head -1 || true)"
    if [ -n "$other" ]; then echo "  ! $name skipped: Hermes already has it at $other"; continue; fi
    place "$dir" "$out"
  done
}

CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/skills"
OPENCODE_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/opencode/skills"
HERMES_DIR="$HOME/.hermes/skills"

case "$target" in
  claude)   echo "Claude Code:";  install_flat "$CLAUDE_DIR" ;;
  opencode) echo "OpenCode:";     install_flat "$OPENCODE_DIR" ;;
  hermes)   echo "Hermes Agent:"; install_hermes "$HERMES_DIR" ;;
  project)
    [ -n "$project" ] && [ -d "$project" ] || { echo "Usage: ./install.sh project <existing-project-dir>" >&2; exit 1; }
    mode="copy"   # symlinks to a personal path must not be committed to a project
    echo "Project $project:"; install_flat "$(cd "$project" && pwd)/.claude/skills" ;;
  all)
    echo "Claude Code:";  install_flat "$CLAUDE_DIR"
    echo "OpenCode:";     install_flat "$OPENCODE_DIR"
    echo "Hermes Agent:"; install_hermes "$HERMES_DIR" ;;
  *) echo "Unknown target: $target" >&2; usage >&2; exit 1 ;;
esac

if [ "$matched" -eq 0 ]; then
  echo "No skills matched --category '$categories'. See ./install.sh --list" >&2; exit 1
fi
echo "Done. Restart your agent to load the skills."
