# unrealX v1.0.0.0

**Adaptive Visual Fidelity Engine for Android root modules**

Author: DREAM_WAS
GitHub: github.com/dreammwas
Telegram: https://t.me/uwEspresso

## Design promise

unrealX never claims a graphics feature unless the target device exposes a verifiable interface or the user/game provides a supported configuration surface. Unknown and unsupported capabilities are skipped. No overclocking, undervolting, thermal bypass, telemetry, network service, anti-cheat bypass, memory injection, or fake benchmark reporting is included.

## Runtime model

Read-only device/GPU/kernel/thermal detection is performed from shell. The default graphics modules expose the required detect/validate/apply/verify/rollback contract but report unsupported until a game-specific, reversible, measurable integration exists.

## Root managers

The root compatibility layer recognizes Magisk, Magisk Delta, KernelSU, KernelSU Next, APatch, SukiSU, ReSukiSU, plus an unknown-root-manager fallback. Lifecycle logic does not depend on a manager-specific hard-coded path.

## Assets

`assets/banner.png` is now populated from the user-supplied branding image and the original source is preserved as `assets/banner-source.jpg`. The supplied `emoji.zip` is preserved byte-for-byte as `assets/emoji-original.zip`; its WebM assets are registered and used by the WebUI. No standard/default emoji set is introduced.
