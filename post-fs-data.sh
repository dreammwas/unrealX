#!/system/bin/sh
MODDIR=${0%/*}
# Keep post-fs-data minimal: it is a boot-blocking stage on KernelSU.
. "$MODDIR/core/common.sh"
[ -e /data/adb/unrealX_disable ] && exit 0
ux_log INFO 'post-fs-data: safety gate only'
exit 0
