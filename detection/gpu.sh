#!/system/bin/sh
. "${UX_MODDIR:-/data/adb/modules/unrealx}/core/common.sh"
ux_detect_gpu() {
  vendor=UNKNOWN; renderer=UNKNOWN; driver=UNKNOWN
  for f in /sys/class/kgsl/kgsl-3d0/gpu_model /sys/class/kgsl/kgsl-3d0/gpu_model_name; do if [ -r "$f" ]; then renderer=$(cat "$f" 2>/dev/null); break; fi; done
  [ "$renderer" = UNKNOWN ] && renderer=$(dumpsys SurfaceFlinger 2>/dev/null | sed -n '/GLES:/p;/GLES version/p;/GL_RENDERER/p' | head -n1)
  case "$renderer" in *Adreno*) vendor=Qualcomm;; *Mali*) vendor=ARM;; *Xclipse*) vendor=Samsung-Xclipse;; *PowerVR*) vendor=PowerVR;; esac
  printf 'vendor=%s\nrenderer=%s\ndriver=%s\n' "$vendor" "$renderer" "$driver" > "$UX_STATE/gpu.conf"
  ux_log INFO "GPU vendor=$vendor renderer=$renderer"
}
ux_detect_gpu
