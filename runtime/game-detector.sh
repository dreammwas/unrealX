#!/system/bin/sh
. "${UX_MODDIR:-/data/adb/modules/unrealx}/core/common.sh"

ux_game_list="$UX_CONFIG/games.conf"

ux_game_detect() {
  [ -r "$ux_game_list" ] || return 1
  for p in /proc/[0-9]*; do
    [ -r "$p/cmdline" ] || continue
    cmd=$(tr '\000' '\n' < "$p/cmdline" 2>/dev/null | head -n1)
    [ -n "$cmd" ] || continue
    awk -F= -v pkg="$cmd" '$1=="package" && $2==pkg {print pkg; exit 0}' "$ux_game_list" && return 0
  done
  return 1
}
