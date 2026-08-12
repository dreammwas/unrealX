# unrealX external assets

Author: DREAM_WAS
GitHub: github.com/dreammwas
Telegram: https://t.me/uwEspresso

## Supplied banner

The user supplied `1000001820.jpg`. It is preserved as:
- `assets/banner-source.jpg`
- `assets/banner.png` (lossless PNG representation used by the WebUI)

## Supplied emoji pack

The original `emoji.zip` is preserved unchanged as:
- `assets/emoji-original.zip`

Its supplied WebM assets are copied without renaming their originals into:
- `assets/emoji/`

Static first-frame PNG representations are provided only for UI contexts that cannot directly consume WebM:
- `assets/emoji/static/`

A machine-readable registry is at:
- `assets/emoji/registry.json`

The WebUI uses the supplied assets only. No standard/default emoji set is introduced.
CLI/log output intentionally uses textual status labels because POSIX shell output cannot reliably render the supplied WebM assets.
