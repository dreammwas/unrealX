#!/system/bin/sh
MODDIR=${0%/*}
. "$MODDIR/core/common.sh"
. "$MODDIR/core/webstate.sh"
[ -e /data/adb/unrealX_disable ] && exit 0
ux_webstate_update || true
ux_log INFO 'boot-completed: unrealX ready'
exit 0
