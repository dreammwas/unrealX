#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
sh -n "$ROOT/bin/unrealX"
sh -n "$ROOT/service.sh"
echo 'config/runtime syntax: PASS'
