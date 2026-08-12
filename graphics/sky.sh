#!/system/bin/sh
. "${UX_MODDIR:-/data/adb/modules/unrealx}/core/common.sh"
ux_sky_detect() { echo UNSUPPORTED; }
ux_sky_validate() { [ "$1" = UNSUPPORTED ] && return 0; return 1; }
ux_sky_apply() { return 0; }
ux_sky_verify() { echo UNSUPPORTED; }
ux_sky_rollback() { return 0; }
