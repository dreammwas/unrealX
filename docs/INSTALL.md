# Install

1. Install the ZIP using a supported root manager module installer.
2. Reboot only if your manager requires it for module activation.
3. Open the KernelSU WebUI when available, or run `su -c /data/adb/modules/unrealx/bin/unrealX doctor`.
4. Confirm the module reports only capabilities it can actually observe.

The package does not require a metamodule because it does not mount or replace `/system` files. KernelSU documents metamodules as necessary only for system-directory modification.
