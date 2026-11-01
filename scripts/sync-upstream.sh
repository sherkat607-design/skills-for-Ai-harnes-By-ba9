#!/usr/bin/env bash
# Re-copy the third-party skills listed in upstream.tsv from the latest commit
# of each upstream repository, and regenerate THIRD_PARTY_NOTICES.md.
# Skills are copied unmodified; a LICENSE file is added to any skill folder
# that lacks one. Original skills (not in upstream.tsv) are never touched.
#
# Usage: scripts/sync-upstream.sh
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MANIFEST="$ROOT/upstream.tsv"
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

rows() { grep -v -e '^#' -e '^[[:space:]]*$' "$MANIFEST"; }

# 1. Clone every upstream repo once.
for repo in $(rows | cut -f3 | sort -u); do
  dir="$WORK/${repo//\//_}"
  echo "Cloning $repo"
  git clone -q --depth 1 "https://github.com/$repo" "$dir"
  git -C "$dir" rev-parse HEAD > "$dir.sha"
done

# 2. Copy each skill and make sure it carries a license file.
notices="$WORK/notices.md"
: > "$notices"
while IFS=$'\t' read -r category name repo path license; do
  src="$WORK/${repo//\//_}/$path"
  dest="$ROOT/skills/$category/$name"
  [ -f "$src/SKILL.md" ] || { echo "ERROR: $repo/$path/SKILL.md not found" >&2; exit 1; }
  rm -rf "$dest"
  mkdir -p "$(dirname "$dest")"
  cp -R "$src" "$dest"
  find "$dest" -name .DS_Store -delete
  if ! ls "$dest" | grep -qiE '^(licen[cs]e|copying)'; then
    top="$(ls "$WORK/${repo//\//_}" | grep -iE '^licen[cs]e(\.md|\.txt)?$' | head -1 || true)"
    if [ -n "$top" ]; then
      cp "$WORK/${repo//\//_}/$top" "$dest/LICENSE"
    elif [ -f "$ROOT/licenses/${repo//\//_}.txt" ]; then
      cp "$ROOT/licenses/${repo//\//_}.txt" "$dest/LICENSE"
    else
      echo "ERROR: no license file found for $repo" >&2; exit 1
    fi
  fi
  sha="$(cat "$WORK/${repo//\//_}.sha")"
  printf '| `%s` | %s | [%s](https://github.com/%s/tree/%s/%s) | %s |\n' \
    "$name" "$category" "$repo" "$repo" "$sha" "$path" "$license" >> "$notices"
  echo "  + $category/$name"
done < <(rows)

# 3. Write THIRD_PARTY_NOTICES.md.
{
  echo "# Third-party notices"
  echo
  echo "The MIT license in [LICENSE](LICENSE) covers the original skills and scripts in this"
  echo "repository. The skills below were copied **unmodified** from their upstream"
  echo "repositories and keep their own licenses; each folder contains its license file."
  echo "Changes made: a \`LICENSE\` file was added to folders that lacked one, and some"
  echo "folders were renamed to match the skill's \`name\` field."
  echo
  echo "| Skill | Category | Source (exact commit) | License |"
  echo "|---|---|---|---|"
  sort -t'|' -k3,3 -k2,2 "$notices"
  echo
  echo "License texts: MIT ([opensource.org/license/mit](https://opensource.org/license/mit)),"
  echo "Apache-2.0 ([apache.org/licenses/LICENSE-2.0](https://www.apache.org/licenses/LICENSE-2.0)),"
  echo "CC-BY-SA-4.0 ([creativecommons.org/licenses/by-sa/4.0](https://creativecommons.org/licenses/by-sa/4.0/))."
} > "$ROOT/THIRD_PARTY_NOTICES.md"
echo "Done. Review with: git status && scripts/validate.sh"
