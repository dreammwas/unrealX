#!/system/bin/sh
. "${UX_MODDIR:-/data/adb/modules/unrealx}/core/common.sh"
ux_detect_kernel() {
  ux_init_dirs
  { printf 'version=%s\n' "$(uname -r 2>/dev/null)"; printf 'selinux=%s\n' "$(getenforce 2>/dev/null || echo UNKNOWN)"; printf 'devfreq=%s\n' "$( [ -d /sys/class/devfreq ] && echo AVAILABLE || echo UNAVAILABLE )"; printf 'kgsl=%s\n' "$( [ -d /sys/class/kgsl ] && echo AVAILABLE || echo UNAVAILABLE )"; printf 'thermal=%s\n' "$( [ -d /sys/class/thermal ] && echo AVAILABLE || echo UNAVAILABLE )"; } > "$UX_STATE/kernel.conf"
}
ux_detect_kernel
