#!/system/bin/sh
UX_BASE=/data/adb/unrealX
UX_CONFIG="$UX_BASE/config"
UX_STATE="$UX_BASE/state"
UX_BACKUP="$UX_BASE/backup"
UX_RECOVERY="$UX_BASE/recovery"
UX_LOG_DIR="$UX_BASE/logs"
UX_DISABLE=/data/adb/unrealX_disable
UX_MODDIR=${UX_MODDIR:-${0%/*}/..}

ux_init_dirs() { mkdir -p "$UX_CONFIG" "$UX_STATE" "$UX_BACKUP" "$UX_RECOVERY" "$UX_LOG_DIR"; }
ux_now() { date '+%Y-%m-%dT%H:%M:%S%z' 2>/dev/null || echo 'unknown-time'; }
ux_log() { ux_init_dirs; lvl="$1"; shift; printf '%s [%s] [unrealX] %s\n' "$(ux_now)" "$lvl" "$*" >> "$UX_LOG_DIR/unrealX.log"; }
ux_bool() { case "$1" in 1|true|TRUE|yes|YES|on|ON) return 0;; *) return 1;; esac; }
ux_num() { case "$1" in ''|*[!0-9]*) return 1;; *) return 0;; esac; }
ux_cmd() { command -v "$1" >/dev/null 2>&1; }
ux_safe_write() { target="$1"; value="$2"; [ -e "$target" ] || return 2; [ -w "$target" ] || return 3; case "$target" in /sys/*|/proc/*) printf '%s' "$value" > "$target" 2>/dev/null || return $?;; *) return 4;; esac; }
