# unrealX r3 audit

Author: DREAM_WAS | github.com/dreammwas | t.me/uwEspresso

## Fixed
- WebUI no longer depends exclusively on a privileged KernelSU bridge for status rendering.
- Boot/service state is published to `webroot/state.txt`.
- Official `import { exec } from 'kernelsu'` API is supported.
- Compatible global `window.ksu.exec` bridge is supported.
- No-bridge environments become read-only instead of displaying fake UNKNOWN values.
- Added device/Android/kernel/RAM/GPU/thermal/adaptive information to the fallback dashboard.
- Added `action.sh`.
- Added KernelSU `webuiIcon` and `actionIcon`.
- Added local banner/icon metadata and root-level branding copies for manager/fork compatibility.
- Improved fork detection ordering.
- Added WebUI X `config.json`.

## Intentional limitations
- A manager that does not expose a privileged WebUI API cannot safely receive root commands directly from JavaScript.
- In that environment, profile/action controls are disabled rather than using an unsafe hidden network server.
- Game-specific shader/LOD/water changes remain unsupported unless a verified game adapter exists.
- No thermal bypass, overclock, undervolt, anti-cheat bypass, telemetry, or remote update execution.
