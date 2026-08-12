#!/system/bin/sh
# unrealX installer
# Author: DREAM_WAS | github.com/dreammwas | t.me/uwEspresso
# Use MODPATH: customize.sh is sourced by Magisk/Kitsune-style installers,
# so $0 is not a reliable path to the extracted module payload.

ux_abort() {
    if command -v abort >/dev/null 2>&1; then
        abort "$1"
    fi
    printf '%s\n' "[unrealX] ERROR: $1" >&2
    return 1
}

MODPATH=${MODPATH:-} 

printf '%s\n' '****************************************'
printf '%s\n' '* unrealX - Adaptive Visual Fidelity  *'
printf '%s\n' '* by DREAM_WAS                       *'
printf '%s\n' '* github.com/dreammwas              *'
printf '%s\n' '* t.me/uwEspresso                    *'
printf '%s\n' '****************************************'
printf '%s\n' '[unrealX] validating extracted package layout'

[ -n "$MODPATH" ] || ux_abort 'Installer did not provide MODPATH'
[ -d "$MODPATH" ] || ux_abort "Invalid module path: $MODPATH"
[ -f "$MODPATH/module.prop" ] || ux_abort 'Missing module.prop'
[ -f "$MODPATH/bin/unrealX" ] || ux_abort 'Missing bin/unrealX'
[ -f "$MODPATH/webroot/index.html" ] || ux_abort 'Missing webroot/index.html'
[ -f "$MODPATH/service.sh" ] || ux_abort 'Missing service.sh'
[ -f "$MODPATH/post-fs-data.sh" ] || ux_abort 'Missing post-fs-data.sh'

chmod 0755 \
    "$MODPATH/bin/unrealX" \
    "$MODPATH/service.sh" \
    "$MODPATH/post-fs-data.sh" \
    "$MODPATH/boot-completed.sh" \
    "$MODPATH/uninstall.sh" \
    2>/dev/null || true

find "$MODPATH/core" "$MODPATH/detection" "$MODPATH/graphics" \
     "$MODPATH/runtime" "$MODPATH/kernel" "$MODPATH/safety" "$MODPATH/recovery" \
     -type f -name '*.sh' -exec chmod 0755 {} \; 2>/dev/null || true

mkdir -p /data/adb/unrealX/config \
         /data/adb/unrealX/state \
         /data/adb/unrealX/backup \
         /data/adb/unrealX/recovery \
         /data/adb/unrealX/logs 2>/dev/null || true

printf '%s\n' '[unrealX] package validation complete'
printf '%s\n' '[unrealX] installation can continue safely'
