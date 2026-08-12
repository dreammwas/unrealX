#!/system/bin/sh
. "${UX_MODDIR:-/data/adb/modules/unrealx}/core/common.sh"
ux_rollback() { [ -r "$UX_RECOVERY/last_backup" ] || return 2; src=$(cat "$UX_RECOVERY/last_backup"); [ -d "$src" ] || return 3; cp -f "$src"/*.conf "$UX_CONFIG"/ 2>/dev/null || true; rm -f "$UX_STATE"/*.conf; }
