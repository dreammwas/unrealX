#!/system/bin/sh
MODDIR=${0%/*}
. "$MODDIR/core/common.sh"
. "$MODDIR/core/config.sh"
. "$MODDIR/detection/root_manager.sh"
. "$MODDIR/core/webstate.sh"
[ -e /data/adb/unrealX_disable ] && { ux_log WARN 'Emergency disable file present; runtime disabled'; exit 0; }
ux_init_dirs
if ux_bool "$(ux_config_get safe_mode false)" || [ -e "$UX_STATE/safe_mode" ]; then
    ux_log WARN 'Safe mode active; adaptive/runtime tuning disabled'
    "$MODDIR/bin/unrealX" detect --write-state >/dev/null 2>&1 || true
    ux_webstate_update || true
    exit 0
fi
ux_log INFO 'service: starting hardware-safe initialization'
root_manager_detect || true
"$MODDIR/bin/unrealX" detect --write-state || ux_log WARN 'Detection returned non-zero; safe fallback remains active'
"$MODDIR/bin/unrealX" verify || ux_log WARN 'Verification found unsupported or unavailable capabilities'
if ux_bool "$(ux_config_get adaptive_engine true)"; then
    "$MODDIR/bin/unrealX" runtime --once >/dev/null 2>&1 || ux_log WARN 'Runtime pass skipped'
fi
ux_webstate_update || ux_log WARN 'webstate update skipped'
exit 0
