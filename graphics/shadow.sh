#!/system/bin/sh
. "${UX_MODDIR:-/data/adb/modules/unrealx}/core/common.sh"
ux_shadow_detect() { echo UNSUPPORTED; }
ux_shadow_validate() { [ "$1" = UNSUPPORTED ] && return 0; return 1; }
ux_shadow_apply() { return 0; }
ux_shadow_verify() { echo UNSUPPORTED; }
ux_shadow_rollback() { return 0; }
