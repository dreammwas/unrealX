#!/system/bin/sh
. "${UX_MODDIR:-/data/adb/modules/unrealx}/core/common.sh"
ux_color_detect() { echo UNSUPPORTED; }
ux_color_validate() { [ "$1" = UNSUPPORTED ] && return 0; return 1; }
ux_color_apply() { return 0; }
ux_color_verify() { echo UNSUPPORTED; }
ux_color_rollback() { return 0; }
