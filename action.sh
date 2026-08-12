#!/system/bin/sh
MODDIR=${0%/*}
UX_MODDIR="$MODDIR"; export UX_MODDIR
. "$MODDIR/core/common.sh"
. "$MODDIR/core/config.sh"
. "$MODDIR/core/webstate.sh"
"$MODDIR/bin/unrealX" detect >/dev/null 2>&1 || true
ux_webstate_update || true
ux_log INFO "action: state refreshed"
if command -v ui_print >/dev/null 2>&1; then
  ui_print "unrealX state refreshed"
else
  printf '%s\n' "unrealX state refreshed"
fi
