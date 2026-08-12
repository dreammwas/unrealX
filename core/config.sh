#!/system/bin/sh
. "${UX_MODDIR:-/data/adb/modules/unrealx}/core/common.sh"
ux_config_file="$UX_CONFIG/global.conf"
ux_config_init() {
  ux_init_dirs
  [ -f "$ux_config_file" ] || cat >"$ux_config_file" <<'EOF'
schema_version=1
profile=realistic
adaptive_engine=true
thermal_protection=true
frame_strategy=balanced
logging=true
safe_mode=false
game_auto_detection=false
EOF
}
ux_config_get() { ux_config_init; key="$1"; def="$2"; awk -F= -v k="$key" '$1==k {sub(/^[^=]*=/,""); print; found=1; exit} END{if(!found) print ""}' "$ux_config_file" | { IFS= read -r v; [ -n "$v" ] && printf '%s\n' "$v" || printf '%s\n' "$def"; }; }
ux_config_set() { ux_config_init; key="$1"; val="$2"; case "$key" in ''|*[!A-Za-z0-9._-]*) return 2;; esac; tmp="$ux_config_file.tmp"; awk -F= -v k="$key" -v v="$val" 'BEGIN{done=0} $1==k{print k"="v; done=1; next} {print} END{if(!done) print k"="v}' "$ux_config_file" >"$tmp" && mv "$tmp" "$ux_config_file"; }
