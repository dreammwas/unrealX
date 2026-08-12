#!/system/bin/sh
. "${UX_MODDIR:-/data/adb/modules/unrealx}/core/common.sh"
ux_backup_state() { ux_init_dirs; stamp=$(date +%Y%m%d-%H%M%S 2>/dev/null); dest="$UX_BACKUP/$stamp"; mkdir -p "$dest"; cp -f "$UX_CONFIG"/*.conf "$dest"/ 2>/dev/null || true; printf '%s\n' "$dest" > "$UX_RECOVERY/last_backup"; }
