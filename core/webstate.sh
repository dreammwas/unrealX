#!/system/bin/sh
. "${UX_MODDIR:-/data/adb/modules/unrealx}/core/common.sh"
. "${UX_MODDIR:-/data/adb/modules/unrealx}/core/config.sh"

ux_read_conf() {
  f="$1"; k="$2"
  [ -r "$f" ] || { printf '%s' "UNKNOWN"; return; }
  awk -F= -v k="$k" '$1==k{sub(/^[^=]*=/,"");print;exit}' "$f" 2>/dev/null
}

ux_webstate_update() {
  ux_init_dirs
  state_file="${UX_MODDIR:-/data/adb/modules/unrealx}/webroot/state.txt"
  tmp="$state_file.tmp"
  [ -d "$(dirname "$state_file")" ] || return 1

  rm -f "$tmp"
  {
    printf 'schema_version=1\n'
    printf 'profile=%s\n' "$(ux_config_get profile realistic)"
    printf 'adaptive_engine=%s\n' "$(ux_config_get adaptive_engine true)"
    printf 'safe_mode=%s\n' "$(ux_config_get safe_mode false)"
    printf 'root_manager=%s\n' "$(cat "$UX_STATE/root_manager" 2>/dev/null || printf UNKNOWN)"
    printf 'root_status=%s\n' "$(cat "$UX_STATE/root_manager_status" 2>/dev/null || printf UNKNOWN)"
    printf 'gpu_vendor=%s\n' "$(ux_read_conf "$UX_STATE/gpu.conf" vendor)"
    printf 'gpu_renderer=%s\n' "$(ux_read_conf "$UX_STATE/gpu.conf" renderer)"
    printf 'thermal_state=%s\n' "$(ux_read_conf "$UX_STATE/thermal.conf" state)"
    printf 'temperature_millic=%s\n' "$(ux_read_conf "$UX_STATE/thermal.conf" temp_millic)"
    printf 'adaptive_state=%s\n' "$(ux_read_conf "$UX_STATE/adaptive.conf" state)"
    printf 'adaptive_reason=%s\n' "$(ux_read_conf "$UX_STATE/adaptive.conf" reason)"
    printf 'device_model=%s\n' "$(ux_read_conf "$UX_STATE/device.conf" model)"
    printf 'manufacturer=%s\n' "$(ux_read_conf "$UX_STATE/device.conf" manufacturer)"
    printf 'android=%s\n' "$(ux_read_conf "$UX_STATE/device.conf" android)"
    printf 'sdk=%s\n' "$(ux_read_conf "$UX_STATE/device.conf" sdk)"
    printf 'ram_kb=%s\n' "$(ux_read_conf "$UX_STATE/device.conf" ram_kb)"
    printf 'kernel=%s\n' "$(ux_read_conf "$UX_STATE/device.conf" kernel)"
    printf 'gki=%s\n' "$(ux_read_conf "$UX_STATE/device.conf" gki)"
    printf 'graphics_interfaces=%s\n' "$(cat "$UX_STATE/graphics_interfaces" 2>/dev/null || printf UNKNOWN)"
    printf 'thermal_interface=%s\n' "$(cat "$UX_STATE/thermal_interface" 2>/dev/null || printf UNKNOWN)"
    printf 'timestamp=%s\n' "$(ux_now)"
  } > "$tmp" && mv -f "$tmp" "$state_file"
}
