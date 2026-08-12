#!/system/bin/sh
MODDIR=${0%/*}
. "$MODDIR/core/common.sh"
ux_log INFO 'uninstall: disabling runtime and cleaning transient state'
rm -rf /data/adb/unrealX/state /data/adb/unrealX/recovery
exit 0
