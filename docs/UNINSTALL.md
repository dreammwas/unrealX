# Uninstall

Disable the module first if troubleshooting. Then remove it using the root manager. The uninstall hook removes transient state but does not touch unrelated user data.

For emergency recovery before uninstall, create `/data/adb/unrealX_disable`. The runtime checks this marker before optional work.
