#!/system/bin/sh
. "${UX_MODDIR:-/data/adb/modules/unrealx}/core/common.sh"
ux_water_detect() { echo UNSUPPORTED; }
ux_water_validate() { [ "$1" = UNSUPPORTED ] && return 0; return 1; }
ux_water_apply() { return 0; }
ux_water_verify() { echo UNSUPPORTED; }
ux_water_rollback() { return 0; }
