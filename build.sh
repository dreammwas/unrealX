#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
OUT="$ROOT/../unrealX-v1.0.0.0.zip"
rm -f "$OUT"
cd "$ROOT"
zip -qr "$OUT" . -x '*.git*' -x 'tests/fixtures/*'
printf '%s\n' "Built: $OUT"
