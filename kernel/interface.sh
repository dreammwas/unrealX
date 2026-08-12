#!/system/bin/sh
. "${UX_MODDIR:-/data/adb/modules/unrealx}/core/common.sh"
ux_kernel_feature_state() { path="$1"; [ -e "$path" ] || { echo UNSUPPORTED; return; }; [ -r "$path" ] || { echo BLOCKED; return; }; [ -w "$path" ] && echo SUPPORTED || echo UNSUPPORTED; }
ux_kernel_probe() {
  out="$UX_STATE/kernel_capabilities.conf"; : > "$out"
  printf 'kgsl_gpu_freq=%s\n' "$(ux_kernel_feature_state /sys/class/kgsl/kgsl-3d0/devfreq/cur_freq)" >> "$out"
  printf 'devfreq_governor=%s\n' "$(ux_kernel_feature_state /sys/class/devfreq)" >> "$out"
  printf 'thermal_zone=%s\n' "$( [ -d /sys/class/thermal ] && echo SUPPORTED || echo UNSUPPORTED )" >> "$out"
  printf 'scheduler_tuning=UNSUPPORTED\n' >> "$out"
  printf 'memory_tuning=UNSUPPORTED\n' >> "$out"
}
