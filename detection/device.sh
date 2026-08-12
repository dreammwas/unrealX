#!/system/bin/sh
. "${UX_MODDIR:-/data/adb/modules/unrealx}/core/common.sh"
ux_prop() { getprop "$1" 2>/dev/null | head -n1; }
ux_detect_device() {
  ux_init_dirs
  {
    printf 'model=%s\n' "$(ux_prop ro.product.model)"
    printf 'manufacturer=%s\n' "$(ux_prop ro.product.manufacturer)"
    printf 'soc=%s\n' "$(ux_prop ro.soc.manufacturer)-$(ux_prop ro.soc.model)"
    printf 'android=%s\n' "$(ux_prop ro.build.version.release)"
    printf 'sdk=%s\n' "$(ux_prop ro.build.version.sdk)"
    printf 'abi=%s\n' "$(ux_prop ro.product.cpu.abilist)"
    printf 'ram_kb=%s\n' "$(awk '/MemTotal:/{print $2; exit}' /proc/meminfo 2>/dev/null)"
    printf 'kernel=%s\n' "$(uname -r 2>/dev/null)"
    printf 'gki=%s\n' "$(case "$(uname -r 2>/dev/null)" in 5.4*|5.10*|5.15*|6.*) echo UNKNOWN;; *) echo UNKNOWN;; esac)"
  } > "$UX_STATE/device.conf"
}
ux_detect_device
