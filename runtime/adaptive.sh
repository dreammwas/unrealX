#!/system/bin/sh
. "${UX_MODDIR:-/data/adb/modules/unrealx}/core/common.sh"

UX_ADAPT_STATE="$UX_STATE/adaptive.conf"
UX_ADAPT_COOLDOWN=15

ux_adaptive_now() {
  date +%s 2>/dev/null || echo 0
}

ux_adaptive_step() {
  ux_init_dirs
  thermal_state=UNKNOWN
  [ -r "$UX_STATE/thermal.conf" ] && . "$UX_STATE/thermal.conf" 2>/dev/null || true

  prev=IDLE
  last=0
  [ -r "$UX_ADAPT_STATE" ] && . "$UX_ADAPT_STATE" 2>/dev/null || true

  now_ts="$(ux_adaptive_now)"
  case "$now_ts" in ''|*[!0-9]*) now_ts=0;; esac
  case "$last" in ''|*[!0-9]*) last=0;; esac

  # Hysteresis/cooldown: do not change state repeatedly inside the cooldown window.
  if [ "$now_ts" -gt 0 ] && [ "$last" -gt 0 ] && [ $((now_ts-last)) -lt "$UX_ADAPT_COOLDOWN" ]; then
    next="$prev"
    reason=COOLDOWN
  else
    case "$thermal_state" in
      CRITICAL_THERMAL) next=CRITICAL_THERMAL; reason=THERMAL_CRITICAL;;
      THERMAL_PRESSURE) next=THERMAL_PRESSURE; reason=THERMAL_PRESSURE;;
      HIGH_LOAD) next=HIGH_LOAD; reason=THERMAL_HIGH_LOAD;;
      NORMAL) next=NORMAL; reason=THERMAL_NORMAL;;
      IDLE) next=IDLE; reason=THERMAL_IDLE;;
      *) next=SAFE_UNKNOWN; reason=UNKNOWN_NO_CHANGE;;
    esac
    last="$now_ts"
  fi

  printf 'state=%s\nsource=%s\nlast_transition=%s\nreason=%s\n' \
    "$next" "$thermal_state" "$last" "$reason" > "$UX_ADAPT_STATE"
  ux_log INFO "adaptive state=$next source=$thermal_state reason=$reason"
}
