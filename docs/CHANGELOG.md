## 1.0.0.0-r3

- Fixed WebUI `UNKNOWN` state on managers that do not expose the KernelSU privileged JavaScript API by adding a boot-generated read-only `state.txt` fallback.
- Added compatibility probing for the official `kernelsu` module API and standalone `window.ksu.exec` bridge.
- Added device, Android, kernel, RAM, GPU, thermal and adaptive state to the fallback dashboard.
- Added `action.sh` for KernelSU action-button state refresh.
- Added `webuiIcon` and `actionIcon` using the supplied branding-derived icon.
- Added local `banner`/`icon` metadata and root-level branding assets for manager/fork compatibility.
- Improved root-manager fork detection ordering for ReSukiSU, SukiSU, KernelSU Next and KernelSU.
- Preserved zero-network and zero-telemetry design.
- Author: DREAM_WAS | github.com/dreammwas | t.me/uwEspresso

## 1.0.0.0-branded asset integration

- Integrated the supplied unrealX branding artwork as `assets/banner.png`.
- Preserved the supplied source image as `assets/banner-source.jpg`.
- Preserved the original `emoji.zip` as `assets/emoji-original.zip`.
- Registered all supplied WebM emoji assets.
- Added static first-frame PNGs for non-video UI contexts.
- Updated KSU WebUI branding and status presentation to use only supplied assets.
- No standard/default emoji assets were added.
- Author: DREAM_WAS | github.com/dreammwas | t.me/uwEspresso

# Changelog

## v1.0.0.0
- Initial production-oriented adaptive framework baseline.
- Manager-agnostic root detection.
- Read-only device/GPU/kernel/thermal detection.
- Safe capability matrix with UNKNOWN/UNSUPPORTED fallback.
- Profile engine, adaptive state machine, rollback, emergency-disable gate.
- KernelSU-compatible WebUI.
- CLI and diagnostics.
- No placebo system properties, overclocking, undervolting, thermal bypass, telemetry, or network runtime.

Author: DREAM_WAS | github.com/dreammwas | t.me/uwEspresso

## Installer hotfix: 1.0.0.0-r1

- Fixed the Magisk/Kitsune installation failure reporting `Missing bin/unrealX`.
- `customize.sh` now uses the installer-provided `MODPATH` instead of deriving its path from `$0`.
- Added validation for `module.prop`, `bin/unrealX`, `webroot/index.html`, `service.sh`, and `post-fs-data.sh`.
- Kept all runtime behavior safety-first and manager-agnostic.
