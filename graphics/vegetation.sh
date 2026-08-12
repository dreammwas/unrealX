#!/system/bin/sh
. "${UX_MODDIR:-/data/adb/modules/unrealx}/core/common.sh"
ux_vegetation_detect() { echo UNSUPPORTED; }
ux_vegetation_validate() { [ "$1" = UNSUPPORTED ] && return 0; return 1; }
ux_vegetation_apply() { return 0; }
ux_vegetation_verify() { echo UNSUPPORTED; }
ux_vegetation_rollback() { return 0; }
