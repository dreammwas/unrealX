# KernelSU WebUI

unrealX uses the documented KernelSU `webroot/index.html` model and the `kernelsu` JavaScript package only for command execution from the Manager WebView. The page remains usable as a read-only presentation if the API is unavailable.

The WebUI does not assume browser JavaScript can directly access privileged Android state.

## r3 compatibility behavior

The WebUI first attempts the official KernelSU JavaScript module API (`import { exec } from 'kernelsu'`). KernelSU documents this API for module WebUI shell execution.

If the host exposes a compatible global `ksu.exec` bridge, unrealX uses it. If no privileged bridge exists, the dashboard becomes **read-only** rather than showing fake `UNKNOWN` values: boot/service scripts publish verified state to `webroot/state.txt`, which the page reads with ordinary WebView file access.

This matters for Magisk/Kitsune-style managers: a manager can render `webroot/index.html` without necessarily exposing KernelSU's privileged JavaScript API. A standalone WebUI host can provide a privileged bridge when installed.

The WebUI never creates a remote network listener and never requires telemetry.
