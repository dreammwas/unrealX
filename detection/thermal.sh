#!/system/bin/sh
. "${UX_MODDIR:-/data/adb/modules/unrealx}/core/common.sh"

ux_read_temp_millic() {
  max=0; found=0
  for z in /sys/class/thermal/thermal_zone*/temp; do
    [ -r "$z" ] || continue
    v=$(cat "$z" 2>/dev/null)
    case "$v" in ''|*[!0-9-]*) continue;; esac
    [ "$v" -gt "$max" ] && max="$v"
    found=1
  done
  [ "$found" -eq 1 ] && { printf '%s\n' "$max"; return; }
  printf '%s\n' UNKNOWN
}

ux_thermal_state() {
  t="$1"
  case "$t" in
    UNKNOWN) echo UNKNOWN; return;;
    ''|*[!0-9]*) echo UNKNOWN; return;;
  esac

  # Hysteresis is based on the previous state, so boundary temperatures do not flap.
  prev=UNKNOWN
  [ -r "$UX_STATE/thermal.conf" ] && . "$UX_STATE/thermal.conf" 2>/dev/null || true

  case "$prev" in
    CRITICAL_THERMAL)
      [ "$t" -ge 45000 ] && { echo CRITICAL_THERMAL; return; }
      ;;
    THERMAL_PRESSURE)
      [ "$t" -ge 41000 ] && { echo THERMAL_PRESSURE; return; }
      ;;
    HIGH_LOAD)
      [ "$t" -ge 37000 ] && { echo HIGH_LOAD; return; }
      ;;
    NORMAL)
      [ "$t" -ge 32000 ] && { echo NORMAL; return; }
      ;;
  esac

  if [ "$t" -ge 47000 ]; then
    echo CRITICAL_THERMAL
  elif [ "$t" -ge 43000 ]; then
    echo THERMAL_PRESSURE
  elif [ "$t" -ge 39000 ]; then
    echo HIGH_LOAD
  elif [ "$t" -ge 34000 ]; then
    echo NORMAL
  else
    echo IDLE
  fi
}

ux_detect_thermal() {
  ux_init_dirs
  temp=$(ux_read_temp_millic)
  state=$(ux_thermal_state "$temp")
  printf 'temp_millic=%s\nstate=%s\n' "$temp" "$state" > "$UX_STATE/thermal.conf"
}
ux_detect_thermal
