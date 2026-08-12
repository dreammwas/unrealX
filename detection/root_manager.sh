#!/system/bin/sh
. "${UX_MODDIR:-/data/adb/modules/unrealx}/core/common.sh"
root_manager_name=UNKNOWN
root_manager_status=UNKNOWN
root_manager_detect() {
  root_manager_name=UNKNOWN; root_manager_status=UNKNOWN

  # Detect named forks before generic KernelSU because several forks retain KSU-compatible paths.
  if [ -x /data/adb/resukisu/bin/ksud ] || [ -d /data/adb/resukisu ]; then
    root_manager_name='ReSukiSU'; root_manager_status=AVAILABLE
  elif [ -x /data/adb/sukisu/bin/ksud ] || [ -d /data/adb/sukisu ]; then
    root_manager_name='SukiSU'; root_manager_status=AVAILABLE
  elif [ -d /data/adb/ksunext ] || [ -x /data/adb/ksunext/bin/ksud ]; then
    root_manager_name='KernelSU Next'; root_manager_status=AVAILABLE
  elif [ "${KSU:-}" = true ] || [ -x /data/adb/ksu/bin/ksud ] || [ -d /data/adb/ksu ]; then
    root_manager_name='KernelSU'; root_manager_status=AVAILABLE
  elif [ -x /data/adb/ap/bin/apd ] || [ -d /data/adb/ap ]; then
    root_manager_name='APatch'; root_manager_status=AVAILABLE
  elif [ -x /data/adb/magisk/magisk ] || [ -x /sbin/magisk ] || [ -d /data/adb/magisk ]; then
    root_manager_name='Magisk'
    if [ -e /data/adb/magisk/.delta ] || magisk -V 2>/dev/null | grep -qi 'delta'; then
      root_manager_name='Magisk Delta'
    fi
    root_manager_status=AVAILABLE
  elif [ -d /data/adb/modules ]; then
    root_manager_name='Unknown root-module manager'; root_manager_status=UNKNOWN
  fi

  printf '%s\n' "$root_manager_name" > "$UX_STATE/root_manager"
  printf '%s\n' "$root_manager_status" > "$UX_STATE/root_manager_status"
  ux_log INFO "root manager: $root_manager_name ($root_manager_status)"
}

root_manager_detect
