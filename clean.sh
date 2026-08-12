#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
rm -f "$ROOT/../unrealX-v1.0.0.0.zip"
rm -f "$ROOT"/**/*.tmp 2>/dev/null || true
printf '%s\n' 'Clean complete.'
