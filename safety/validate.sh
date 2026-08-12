#!/system/bin/sh
. "${UX_MODDIR:-/data/adb/modules/unrealx}/core/common.sh"
ux_validate_value() { case "$2" in ''|*[!0-9A-Za-z._/-]*) return 2;; esac; }
ux_is_safe_feature() { case "$1" in presentation.*|read.*|thermal.read) return 0;; *) return 1;; esac; }
