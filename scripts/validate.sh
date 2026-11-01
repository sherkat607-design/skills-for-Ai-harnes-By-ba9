#!/usr/bin/env bash
# Check every skills/<category>/<name>/SKILL.md so it loads in Claude Code,
# OpenCode and Hermes Agent: frontmatter present, name matches the folder and
# is lowercase-hyphenated (max 64 chars), description is 1-1024 characters,
# and skill names are unique across categories.
set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
errors=0; count=0; seen=""
fail() { echo "FAIL $1: $2"; errors=$((errors + 1)); }

field() {  # field <file> <key>  -> value, joining folded/continued lines
  awk -v key="$2" '
    BEGIN { n = 0; out = ""; on = 0; q = sprintf("%c", 39) }
    /^---[[:space:]]*$/ { n++; if (n == 2) exit; next }
    n == 1 {
      if (on) {
        if ($0 ~ /^[[:space:]]*$/) next
        if ($0 ~ /^[[:space:]]+[^[:space:]]/) { l = $0; sub(/^[[:space:]]+/, "", l); out = out (out == "" ? "" : " ") l; next }
        on = 0
      }
      if (index($0, key ":") == 1) {
        v = substr($0, length(key) + 2); sub(/^[[:space:]]+/, "", v)
        if (v ~ /^[>|][-+]?[[:space:]]*$/) v = ""
        gsub("^[\"" q "]|[\"" q "]$", "", v); out = v; on = 1
      }
    }
    END { print out }' "$1"
}

for file in "$ROOT"/skills/*/*/SKILL.md; do
  dir="$(dirname "$file")"; name="$(basename "$dir")"; category="$(basename "$(dirname "$dir")")"
  rel="${file#"$ROOT"/}"
  count=$((count + 1))
  [ "$(head -1 "$file")" = "---" ] || { fail "$rel" "first line must be ---"; continue; }
  [ "$(grep -c '^---[[:space:]]*$' "$file")" -ge 2 ] || { fail "$rel" "frontmatter is not closed with ---"; continue; }
  echo "$category" | grep -qE '^[0-9]{2}-[a-z0-9-]+$' || fail "$rel" "category folder must look like 01-name"
  fm_name="$(field "$file" name)"
  desc="$(field "$file" description)"
  [ "$fm_name" = "$name" ] || fail "$rel" "name '$fm_name' does not match folder '$name'"
  echo "$name" | grep -qE '^[a-z0-9]+(-[a-z0-9]+)*$' || fail "$rel" "name must be lowercase letters, digits and single hyphens"
  [ "${#name}" -le 64 ] || fail "$rel" "name longer than 64 characters"
  [ -n "$desc" ] || fail "$rel" "description is empty"
  [ "${#desc}" -le 1024 ] || fail "$rel" "description is ${#desc} characters (max 1024)"
  case " $seen " in *" $name "*) fail "$rel" "duplicate skill name '$name'" ;; esac
  seen="$seen $name"
done

echo "$count skills checked, $errors problem(s)."
[ "$errors" -eq 0 ]
