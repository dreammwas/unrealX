#!/system/bin/sh
. "${UX_MODDIR:-/data/adb/modules/unrealx}/core/common.sh"
ux_texture_detect() { echo UNSUPPORTED; }
ux_texture_validate() { [ "$1" = UNSUPPORTED ] && return 0; return 1; }
ux_texture_apply() { return 0; }
ux_texture_verify() { echo UNSUPPORTED; }
ux_texture_rollback() { return 0; }
