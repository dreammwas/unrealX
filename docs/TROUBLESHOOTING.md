# Troubleshooting

## Safe mode

Run `su -c /data/adb/modules/unrealx/bin/unrealX safe-mode`.

## Emergency disable

Create `/data/adb/unrealX_disable`. This bypasses optional runtime work.

## Diagnostics

Run `su -c /data/adb/modules/unrealx/bin/unrealX doctor` and `verify`.

## Missing game-specific controls

This is expected in the baseline. unrealX does not fabricate graphics controls when a game does not expose them.

## Kitsune/Magisk installer says `Missing bin/unrealX`

This was caused by the installer script deriving its extraction directory from `$0`. In Magisk-family installers, `customize.sh` may be sourced rather than executed directly, so `$0` is not a reliable module extraction path.

The fixed package uses the installer-provided `MODPATH` and validates the payload there. Reinstall `unrealX-v1.0.0.0-r1.zip` rather than copying individual files into an existing module.
