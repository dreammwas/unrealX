#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
fail=0
for f in $(find "$ROOT" -type f -name '*.sh' -o -type f -path '*/bin/unrealX'); do if command -v sh >/dev/null 2>&1; then sh -n "$f" || fail=1; fi; done
grep -q '^id=unrealx$' "$ROOT/module.prop" || fail=1
grep -q '^version=1.0.0.0$' "$ROOT/module.prop" || fail=1
test -f "$ROOT/webroot/index.html" || fail=1
test -f "$ROOT/webroot/js/app.js" || fail=1
test -f "$ROOT/webroot/css/app.css" || fail=1
if [ "$fail" -eq 0 ]; then echo 'unrealX tests: PASS'; else echo 'unrealX tests: FAIL'; exit 1; fi
