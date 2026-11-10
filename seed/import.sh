#!/usr/bin/env bash
# Replaces the portfolio content in the "production" dataset with the CV-based seed.
# Needs a logged-in Sanity CLI (npx sanity login). Run from the repo root: ./seed/import.sh
set -euo pipefail

SEED_DIR="$(cd "$(dirname "$0")" && pwd)"
TMP_FILE="$(mktemp -t sanity-seed).ndjson"
sed "s#__SEED_DIR__#${SEED_DIR}#g" "$SEED_DIR/cv-content.ndjson" > "$TMP_FILE"

# Old demo content (sample projects, outdated experience and skills)
npx sanity documents delete \
  05881703-6ea0-4bee-93f3-afc234412907 7ff9f8b3-1f77-4530-9193-cbe364cc908f b67a30d3-2535-48a5-9380-3925f4717ac4 \
  10740617-6a80-4f5b-9ad5-6ab7cf05f852 ad335269-91b8-4646-b017-5a8478c7ca54 c952de66-06e9-43de-bd34-57fa6bea117e \
  d9222832-a77c-4abd-8e24-099d5f0131ee 60408429-10eb-4b70-ad4e-6a1e025d813f || true

npx sanity dataset import "$TMP_FILE" production --replace
rm "$TMP_FILE"
