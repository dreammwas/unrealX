#!/system/bin/sh
. "${UX_MODDIR:-/data/adb/modules/unrealx}/core/common.sh"
ux_capability_matrix() {
  cat > "$UX_STATE/capabilities.conf" <<'EOF'
visual.texture_filtering=UNSUPPORTED
visual.anisotropic=UNSUPPORTED
visual.shadow_quality=UNSUPPORTED
visual.water_quality=UNSUPPORTED
visual.sky_quality=UNSUPPORTED
visual.vegetation_lod=UNSUPPORTED
visual.sharpening=UNSUPPORTED
visual.color_mode=UNSUPPORTED
presentation.safe_configured_games=LIMITED
kernel.scheduler=UNSUPPORTED
kernel.gpu_frequency=UNSUPPORTED
thermal.read=SUPPORTED
frame_time.read=UNSUPPORTED
fps.read=UNSUPPORTED
EOF
}
