#!/system/bin/sh
. "${UX_MODDIR:-/data/adb/modules/unrealx}/core/common.sh"
ux_permission_audit() { ux_init_dirs; { id 2>/dev/null; ls -ld /data/adb/unrealX 2>/dev/null; } > "$UX_STATE/permissions.txt"; }
