<p align="center">
  <img src="assets/banner.png" width="960" alt="unrealX Banner">
</p>

<p align="center">
  <img src="assets/icon.png" width="150" alt="unrealX Logo">
</p>

<h1 align="center">unrealX</h1>

<p align="center">
  <strong>Adaptive Visual Fidelity Engine for Android</strong>
</p>

<p align="center">
  <strong>REALISTIC WHEN POSSIBLE. PERFORMANCE WHEN NEEDED. SAFETY ALWAYS.</strong>
</p>

<p align="center">
  <a href="https://github.com/dreammwas/unrealX/releases">
    <img src="https://img.shields.io/badge/Release-v1.0.0.0--r3-white?style=for-the-badge&logo=github&logoColor=white&labelColor=111111" alt="Release">
  </a>
  <a href="https://github.com/dreammwas/unrealX">
    <img src="https://img.shields.io/badge/Platform-Android-white?style=for-the-badge&logo=android&logoColor=white&labelColor=111111" alt="Android">
  </a>
  <a href="https://t.me/uwEspresso">
    <img src="https://img.shields.io/badge/Community-Telegram-white?style=for-the-badge&logo=telegram&logoColor=white&labelColor=111111" alt="Telegram">
  </a>
  <img src="https://img.shields.io/badge/License-Apache--2.0-white?style=for-the-badge&logo=apache&logoColor=white&labelColor=111111" alt="License">
</p>

<p align="center">
  <a href="#overview">Overview</a> •
  <a href="#architecture">Architecture</a> •
  <a href="#features">Features</a> •
  <a href="#installation">Installation</a> •
  <a href="#safety">Safety</a> •
  <a href="#contributing">Contributing</a>
</p>

---

# `unrealX` — Android Graphics Intelligence

**unrealX** is a hardware-aware, adaptive Android graphics framework distributed as a root module for supported Android root environments.

It is built to replace the traditional "FPS booster" mindset with a capability-driven architecture:

```text
┌──────────────────────────────────────────────────────────────────────────────┐
│                            unrealX v1.0.0.0-r3                              │
├──────────────────────────────────────────────────────────────────────────────┤
│ DETECT → CLASSIFY → VALIDATE → BACKUP → APPLY → VERIFY → ADAPT → ROLLBACK  │
├──────────────────────────────────────────────────────────────────────────────┤
│ Hardware-aware      GPU-aware        Kernel-aware       Thermal-aware        │
│ Game-profile aware  WebUI-driven     Recovery-first    Zero-placebo        │
└──────────────────────────────────────────────────────────────────────────────┘
```

The central engineering rule is:

> **Never claim an optimization unless it can be detected, validated, and measured.**

unrealX is deliberately conservative. When a capability is missing, unknown, blocked, or unsupported, the framework does not fake success.

```text
SUPPORTED  ──► VALIDATE ──► APPLY ──► VERIFY
UNSUPPORTED ───────────────────────────────► SKIP
UNKNOWN    ───────────────────────────────► NO CHANGE
BLOCKED    ───────────────────────────────► NO CHANGE
```

---

# Table of Contents

- [Overview](#overview)
- [Project Identity](#project-identity)
- [Why unrealX](#why-unrealx)
- [Architecture](#architecture)
- [Hardware Intelligence](#hardware-intelligence)
- [Graphics Fidelity Engine](#graphics-fidelity-engine)
- [Adaptive Intelligence](#adaptive-intelligence)
- [Thermal Intelligence](#thermal-intelligence)
- [Game Profile Engine](#game-profile-engine)
- [Kernel Interface Layer](#kernel-interface-layer)
- [Root Manager Compatibility](#root-manager-compatibility)
- [Premium WebUI](#premium-webui)
- [CLI and Diagnostics](#cli-and-diagnostics)
- [Safety and Recovery](#safety-and-recovery)
- [Configuration](#configuration)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Usage](#usage)
- [Benchmark Philosophy](#benchmark-philosophy)
- [Limitations](#limitations)
- [Security](#security)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [Support](#support)
- [License](#license)

---

# Project Identity

```text
╔══════════════════════════════════════════════════════════════════════════════╗
║                                  unrealX                                     ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ Version          : 1.0.0.0-r3                                                ║
║ Project Type     : Adaptive Visual Fidelity Engine                           ║
║ Platform         : Android                                                    ║
║ Distribution     : Root Module                                                ║
║                                                                              ║
║ Author           : DREAM_WAS                                                  ║
║ GitHub           : github.com/dreammwas                                       ║
║ Telegram         : t.me/uwEspresso                                            ║
║                                                                              ║
║ Design           : Pixel-inspired / AMOLED / Minimal / Responsive             ║
║ Philosophy       : Detect-first / Validate-first / Recovery-first             ║
║ Network          : None for core operation                                    ║
║ Telemetry        : None                                                       ║
║ Overclocking     : No                                                         ║
║ Undervolting     : No                                                         ║
║ Thermal bypass   : No                                                         ║
║ Anti-cheat bypass: No                                                         ║
╚══════════════════════════════════════════════════════════════════════════════╝
```

---

# Overview

Traditional Android performance modules often rely on long lists of unrelated properties, generic scheduler writes, forced frequencies, or device-specific assumptions.

unrealX takes a different approach.

```text
                           ┌──────────────────┐
                           │   Android Device │
                           └────────┬─────────┘
                                    │
                           ┌────────▼─────────┐
                           │ Detection Engine │
                           └────────┬─────────┘
                                    │
                     ┌──────────────▼──────────────┐
                     │ Capability Classification   │
                     │ SUPPORTED / UNKNOWN / ...   │
                     └──────────────┬──────────────┘
                                    │
                     ┌──────────────▼──────────────┐
                     │   Profile Resolution       │
                     │ BASE → GPU → DEVICE → GAME │
                     └──────────────┬──────────────┘
                                    │
                     ┌──────────────▼──────────────┐
                     │ Validation + Safety Gates   │
                     └──────────────┬──────────────┘
                                    │
                     ┌──────────────▼──────────────┐
                     │ Apply / Verify / Observe    │
                     └──────────────┬──────────────┘
                                    │
                     ┌──────────────▼──────────────┐
                     │ Adaptive Runtime Controller │
                     └──────────────┬──────────────┘
                                    │
                     ┌──────────────▼──────────────┐
                     │ Rollback / Recovery Layer   │
                     └─────────────────────────────┘
```

The result is intended to be a framework rather than a random collection of tweaks.

---

# Why unrealX

## What unrealX tries to improve

- visual consistency
- supported texture/filtering behavior
- frame-time stability
- sustained gaming behavior
- thermal-aware adaptation
- profile-based control
- observability
- safe rollback
- root-manager compatibility
- WebUI usability

## What unrealX refuses to fake

```text
No real game shader?
→ Do not pretend to create one.

No hardware feature?
→ Do not pretend to enable it.

No kernel interface?
→ Do not write to a guessed node.

No measurable FPS source?
→ Do not invent FPS.

Unknown capability?
→ Do nothing.
```

This principle is part of the architecture, not just documentation.

---

# Features

## Visual Profiles

```text
┌──────────────┬───────────────────────────────────────────────────────────────┐
│ REALISTIC    │ Natural color, balanced contrast, conservative tuning        │
├──────────────┼───────────────────────────────────────────────────────────────┤
│ CINEMATIC    │ Presentation-focused profile with controlled visual balance  │
├──────────────┼───────────────────────────────────────────────────────────────┤
│ ULTRA        │ Higher quality where device/runtime capability permits       │
├──────────────┼───────────────────────────────────────────────────────────────┤
│ BALANCED     │ Visual quality + sustained performance                       │
├──────────────┼───────────────────────────────────────────────────────────────┤
│ PERFORMANCE  │ Frame-time stability and sustained workload priority         │
├──────────────┼───────────────────────────────────────────────────────────────┤
│ BATTERY      │ Lower optional workload and efficiency priority              │
└──────────────┴───────────────────────────────────────────────────────────────┘
```

## Hardware Awareness

unrealX can inspect, where the platform exposes the information:

- device/model
- SoC
- CPU ABI
- GPU vendor
- GPU renderer
- Android version
- kernel version
- RAM information
- thermal state
- available GPU/graphics interfaces
- available thermal interfaces
- root-manager environment
- runtime/profile state

GPU architecture support is structured for:

```text
Qualcomm Adreno
ARM Mali
Samsung Xclipse
PowerVR
Other / Unknown
```

Unknown hardware remains conservative.

---

# Architecture

unrealX is modular by design.

```text
unrealX/
│
├── module lifecycle
│   ├── customize.sh
│   ├── post-fs-data.sh
│   ├── service.sh
│   ├── boot-completed.sh
│   ├── action.sh
│   └── uninstall.sh
│
├── detection
│   ├── device.sh
│   ├── gpu.sh
│   ├── kernel.sh
│   ├── root_manager.sh
│   └── thermal.sh
│
├── core
│   ├── common.sh
│   ├── config.sh
│   └── webstate.sh
│
├── graphics
│   ├── water.sh
│   ├── sky.sh
│   ├── shadow.sh
│   ├── vegetation.sh
│   ├── texture.sh
│   └── color.sh
│
├── runtime
│   ├── adaptive.sh
│   └── game-detector.sh
│
├── kernel
│   ├── capabilities.sh
│   └── interface.sh
│
├── safety
│   ├── validate.sh
│   └── permissions.sh
│
├── recovery
│   ├── backup.sh
│   └── rollback.sh
│
├── profiles
│   └── defaults.json
│
├── bin
│   └── unrealX
│
├── native
│   └── unrealx_probe.c
│
├── rust
│   ├── Cargo.toml
│   └── src/
│
├── webroot
│   ├── index.html
│   ├── css/
│   ├── js/
│   ├── components/
│   └── assets/
│
├── assets
│   ├── banner.png
│   ├── icon.png
│   ├── emoji/
│   └── emoji-original.zip
│
├── tests
└── docs
```

---

# Detection Pipeline

```text
┌──────────────────────────────────────────────────────────────────────────────┐
│                         UNREALX DETECTION PIPELINE                           │
├──────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│ Root Manager ─┐                                                            │
│               │                                                            │
│ Device ───────┼──► Unified Device State ──► Capability Matrix               │
│               │                                  │                           │
│ GPU ──────────┤                                  ▼                           │
│               │                          Safe Profile Resolver               │
│ Kernel ───────┤                                  │                           │
│               │                                  ▼                           │
│ Thermal ──────┘                         Runtime Policy                       │
│                                                                              │
└──────────────────────────────────────────────────────────────────────────────┘
```

Every subsystem reports facts rather than assumptions.

---

# Capability Matrix

A central goal of unrealX is making support explicit.

Conceptually:

```text
┌──────────────────┬───────────────┬──────────────────┬───────────────────────┐
│ FEATURE          │ GPU / DEVICE  │ ANDROID / KERNEL │ STATE                 │
├──────────────────┼───────────────┼──────────────────┼───────────────────────┤
│ Texture Control  │ Detected      │ Exposed?         │ SUPPORTED/UNKNOWN     │
│ Filtering        │ Detected      │ Exposed?         │ SUPPORTED/UNKNOWN     │
│ Shadow Control   │ Game-specific │ Game exposes?   │ UNSUPPORTED/UNKNOWN   │
│ Water Control    │ Game-specific │ Game exposes?   │ UNSUPPORTED/UNKNOWN   │
│ GPU Devfreq      │ Driver-based  │ Node exists?     │ SUPPORTED/UNKNOWN     │
│ Thermal Interface│ Device-based  │ Node exists?     │ SUPPORTED/UNKNOWN     │
│ Scheduler Control│ Kernel-based  │ Node exists?     │ SUPPORTED/UNKNOWN     │
└──────────────────┴───────────────┴──────────────────┴───────────────────────┘
```

### State semantics

```text
SUPPORTED
    Verified and safe to use.

UNSUPPORTED
    Capability does not exist or is not exposed.

UNKNOWN
    Detection is inconclusive.
    UNKNOWN behaves exactly like UNSUPPORTED.

BLOCKED
    Capability exists but cannot safely be used
    in the current runtime/security environment.
```

---

# Graphics Fidelity Engine

The graphics layer is split into independent engines.

```text
                    ┌─────────────────────────────┐
                    │     Visual Fidelity Core    │
                    └──────────────┬──────────────┘
                                   │
        ┌──────────────┬───────────┼───────────┬──────────────┐
        ▼              ▼           ▼           ▼              ▼
      Water           Sky        Shadow      Texture      Vegetation
        │              │           │           │              │
        └──────────────┴───────────┴───────────┴──────────────┘
                                   │
                                   ▼
                            Color / Sharpening
                                   │
                                   ▼
                              Frame Pacing
```

Every engine follows the same conceptual contract:

```text
detect()
validate()
apply()
verify()
rollback()
```

A feature that cannot satisfy that contract remains disabled.

---

# Realistic Water Strategy

unrealX does not claim to generate a new water shader.

Where the target runtime genuinely exposes compatible controls, it can reason about:

- filtering
- anti-aliasing
- supported reflection quality
- supported post-processing
- supported quality levels
- supported LOD behavior

The desired result is:

```text
Natural transparency
      +
Controlled reflections
      +
Reduced aliasing
      +
Balanced specular response
      =
Natural-looking water
```

No fake "blue water" system is used to simulate realism.

---

# Sky Strategy

The sky engine targets:

- natural luminance
- controlled highlights
- balanced tone
- reduced clipping
- cinematic presentation where requested

Profiles:

```text
SKY_NATURAL
SKY_CINEMATIC
SKY_NEUTRAL
```

The framework does not claim to create atmospheric rendering capabilities that the application does not expose.

---

# Shadow Strategy

Shadow goals include:

- stable filtering
- reduced aliasing
- consistent rendering
- supported shadow quality
- appropriate workload

Device tiers:

```text
LOW → MEDIUM → HIGH → ULTRA
```

Maximum is never forced blindly.

---

# Vegetation Strategy

The vegetation engine is intended to improve presentation where the application exposes compatible controls:

```text
Texture filtering
      ↓
Reduced shimmering
      ↓
Better visual stability
      ↓
Appropriate LOD
      ↓
Controlled color
```

Game assets are not modified automatically.

---

# Color Science

The default philosophy is natural rather than oversaturated.

```text
NATURAL
REALISTIC
CINEMATIC
VIBRANT
```

The engine avoids excessive:

- saturation
- gamma manipulation
- sharpening
- crushed contrast
- artificial color shifts

---

# Adaptive Intelligence Engine

The adaptive engine is designed around sustained performance and frame-time stability.

```text
                             ┌──────────┐
                             │   IDLE   │
                             └────┬─────┘
                                  │
                                  ▼
                             ┌──────────┐
                             │ NORMAL   │
                             └────┬─────┘
                                  │
                           sustained workload
                                  │
                                  ▼
                           ┌─────────────┐
                           │  HIGH_LOAD  │
                           └──────┬──────┘
                                  │
                            thermal pressure
                                  │
                                  ▼
                         ┌─────────────────┐
                         │THERMAL_PRESSURE │
                         └────────┬────────┘
                                  │
                              critical
                                  │
                                  ▼
                         ┌─────────────────┐
                         │ CRITICAL_THERMAL│
                         └────────┬────────┘
                                  │
                                cool
                                  │
                                  ▼
                           ┌─────────────┐
                           │  RECOVERY   │
                           └─────────────┘
```

The engine uses cooldown/hysteresis concepts to avoid:

```text
QUALITY ↑
QUALITY ↓
QUALITY ↑
QUALITY ↓
QUALITY ↑
```

during boundary conditions.

The priority is:

```text
frame-time consistency
        >
peak FPS
```

---

# Frame-Pacing Philosophy

A stable rendering cadence is usually more useful than a large but unstable peak.

```text
GOOD

16.7ms
16.8ms
16.6ms
16.7ms
16.7ms


BAD

11ms
18ms
35ms
12ms
27ms
14ms
```

Where frame-time data is not safely observable, unrealX does not fabricate it.

---

# Thermal Intelligence

Thermal behavior is a safety boundary.

```text
┌──────────────┐
│    NORMAL    │
└──────┬───────┘
       ▼
┌──────────────┐
│     WARM     │
└──────┬───────┘
       ▼
┌──────────────┐
│     HOT      │
└──────┬───────┘
       ▼
┌──────────────┐
│   CRITICAL   │
└──────┬───────┘
       ▼
┌──────────────┐
│   RECOVERY   │
└──────────────┘
```

unrealX does **not**:

```text
✗ Disable thermal protection
✗ Raise critical thermal limits
✗ Force unsafe voltage
✗ Force unsafe frequency
✗ Bypass throttling
✗ Rewrite unknown thermal nodes
```

Instead, it can reduce optional workload when thermal pressure is detected.

---

# Game Profile Engine

Game profiles can be layered conceptually:

```text
BASE PROFILE
     ↓
GPU PROFILE
     ↓
DEVICE PROFILE
     ↓
GAME PROFILE
     ↓
USER OVERRIDE
     ↓
RUNTIME ADAPTIVE OVERRIDE
```

Example:

```text
ExampleGame
│
├── Preset: REALISTIC
├── Auto Apply: ON
├── Thermal Policy: ADAPTIVE
├── Frame Strategy: STABILITY_FIRST
├── Compatibility Mode: STANDARD
└── Graphics Policy: CAPABILITY_FIRST
```

A game profile never overrides global settings blindly.

---

# Root Manager Compatibility

unrealX centralizes root-manager detection.

Supported environments include:

- [Magisk](https://github.com/topjohnwu/Magisk)
- Magisk Delta
- [KernelSU](https://github.com/tiann/KernelSU)
- [KernelSU Next](https://github.com/KernelSU-Next/KernelSU-Next)
- [APatch](https://github.com/bmax121/APatch)
- [SukiSU](https://github.com/SukiSU-Ultra/SukiSU-Ultra)
- ReSukiSU-compatible environments
- future/unknown forks through graceful fallback

The architecture avoids making every subsystem depend on a manager-specific path.

```text
                 ┌──────────────────────────┐
                 │  Root Manager Detector   │
                 └────────────┬─────────────┘
                              │
             ┌────────────────┼─────────────────┐
             ▼                ▼                 ▼
          Magisk          KernelSU            APatch
             │                │                 │
             └────────────────┼─────────────────┘
                              ▼
                    Unified Root State
```

Unknown managers never become a reason to run unsafe logic.

---

# Premium WebUI

unrealX includes a premium AMOLED-oriented WebUI.

```text
┌───────────────────────────────────────────────────────────────┐
│ unrealX                                      v1.0.0.0        │
├───────────────────────────────────────────────────────────────┤
│ DEVICE STATUS                                                 │
│                                                               │
│ GPU          CPU          RAM          THERMAL        ROOT    │
│ Adreno       ...          ...          NORMAL         ACTIVE  │
├───────────────────────────────────────────────────────────────┤
│ CURRENT GAME                                                  │
│ ExampleGame                                                   │
│                                                               │
│ PROFILE: REALISTIC       ADAPTIVE: NORMAL                    │
├───────────────────────────────────────────────────────────────┤
│ REALISTIC │ CINEMATIC │ ULTRA │ BALANCED │ PERFORMANCE       │
├───────────────────────────────────────────────────────────────┤
│ HOME │ GAMES │ PROFILES │ PERFORMANCE │ THERMAL │ TOOLS      │
└───────────────────────────────────────────────────────────────┘
```

### UI goals

- Pure AMOLED dark surfaces
- minimal accent treatment
- Pixel-inspired spacing
- responsive layout
- touch-friendly controls
- reduced-animation option
- lightweight rendering
- status-focused cards
- clear error states

No RGB-heavy gamer aesthetic is used.

---

# WebUI State Model

The WebUI consumes a shared state model:

```text
unrealXState
│
├── device
├── gpu
├── kernel
├── root
├── thermal
├── game
├── profile
├── adaptive
├── graphics
├── capabilities
└── errors
```

This reduces duplicated privileged queries and keeps the interface consistent with the runtime engine.

If a value is unavailable:

```text
NOT AVAILABLE
```

If a feature is unsupported:

```text
UNSUPPORTED
```

If detection is inconclusive:

```text
UNKNOWN
```

No fake "active" state is generated.

---

# Custom Asset System

The project accepts externally supplied branding assets.

```text
assets/
├── banner.png
├── icon.png
├── emoji/
│   ├── supplied animations
│   ├── static fallbacks
│   └── registry.json
└── emoji-original.zip
```

The project preserves the original custom asset package and uses it as the source for UI status visuals.

---

# CLI and Diagnostics

Main CLI:

```bash
su -c unrealX status
su -c unrealX detect
su -c unrealX verify

su -c unrealX profile realistic
su -c unrealX profile cinematic
su -c unrealX profile ultra
su -c unrealX profile balanced
su -c unrealX profile performance
su -c unrealX profile battery

su -c unrealX games
su -c unrealX logs
su -c unrealX doctor
su -c unrealX benchmark

su -c unrealX enable
su -c unrealX disable

su -c unrealX safe-mode
su -c unrealX reset-safe-mode

su -c unrealX rollback
```

## `doctor`

The diagnostic engine is designed to inspect:

```text
┌─────────────────────────────────────────────────────────────┐
│ unrealX Doctor                                              │
├─────────────────────────────────────────────────────────────┤
│ [OK] Root manager                                           │
│ [OK] Module state                                           │
│ [OK] Permissions                                            │
│ [OK] GPU detection                                          │
│ [OK] Configuration                                          │
│ [OK] WebUI state                                            │
│ [WARN] Unsupported capability                               │
│ [WARN] Missing optional interface                           │
│ [ERROR] Invalid configuration                               │
└─────────────────────────────────────────────────────────────┘
```

Diagnostics should explain what can be fixed rather than simply reporting failure.

---

# Safety

Safety is part of the runtime architecture.

## Emergency Disable

Create:

```text
/data/adb/unrealX_disable
```

When this file exists:

```text
Optional performance intervention
        ↓
        STOP
```

The framework prioritizes boot safety and recovery.

## Safe Mode

```bash
su -c unrealX safe-mode
```

Safe mode prioritizes:

- recovery
- diagnostics
- reduced intervention
- disabled optional runtime tuning

Reset:

```bash
su -c unrealX reset-safe-mode
```

## Rollback

```bash
su -c unrealX rollback
```

The recovery path is designed to remain usable even when the WebUI is unavailable.

---

# Kernel Interface Layer

unrealX does not blindly patch kernel internals.

It checks for:

- kernel version
- GKI/non-GKI characteristics
- available GPU interfaces
- devfreq interfaces
- thermal interfaces
- scheduler interfaces
- permissions
- SELinux restrictions
- relevant sysfs nodes

Capability state:

```text
SUPPORTED
UNSUPPORTED
UNKNOWN
BLOCKED
```

Only verified interfaces are eligible for use.

---

# Security

unrealX deliberately avoids high-risk behavior.

```text
┌─────────────────────────────────────────────────────────────────────────┐
│                            SECURITY MODEL                               │
├─────────────────────────────────────────────────────────────────────────┤
│ No telemetry                                                            │
│ No hidden network service                                               │
│ No remote shell                                                         │
│ No credential collection                                                │
│ No dynamic executable download                                          │
│ No secret backdoor                                                      │
│ No anti-cheat bypass                                                    │
│ No DRM bypass                                                           │
│ No memory hiding                                                        │
│ No security-detection circumvention                                     │
│ No unsafe kernel memory manipulation                                    │
└─────────────────────────────────────────────────────────────────────────┘
```

---

# Configuration

Configuration is designed to be structured and validated.

Conceptual configuration layers:

```text
global
│
├── hardware
├── profiles
├── games
├── runtime
├── thermal
└── safety
```

Validation pipeline:

```text
Configuration
      │
      ▼
Schema Validation
      │
 ┌────┴────┐
 │         │
VALID    INVALID
 │         │
 ▼         ▼
Load     Reject
 │         │
 ▼         ▼
Apply   Previous Valid State
```

Malformed configuration must never become privileged behavior.

---

# Installation

## Requirements

- Android device
- Supported root environment
- Backup/recovery path recommended for testing
- Android version compatible with your root manager

## Install

1. Download the latest release ZIP.
2. Open your root manager.
3. Install the `unrealX` ZIP as a module.
4. Reboot.
5. Open the module WebUI where supported.
6. Run diagnostics.

After reboot:

```bash
su -c unrealX detect
su -c unrealX verify
su -c unrealX doctor
su -c unrealX status
```

---

# Usage

## Select a profile

```bash
su -c unrealX profile realistic
```

or:

```bash
su -c unrealX profile balanced
```

or:

```bash
su -c unrealX profile performance
```

## Inspect hardware

```bash
su -c unrealX detect
```

## Inspect health

```bash
su -c unrealX doctor
```

## View current state

```bash
su -c unrealX status
```

## Enter Safe Mode

```bash
su -c unrealX safe-mode
```

## Roll back

```bash
su -c unrealX rollback
```

---

# Benchmark Philosophy

unrealX refuses to fabricate benchmark results.

Where safe observation is available, benchmark data can include:

- frame-time
- FPS
- GPU utilization
- CPU utilization
- RAM
- thermal state
- profile transitions

A measured optimization should follow:

```text
BASELINE
   ↓
CONTROLLED CHANGE
   ↓
REPEAT TEST
   ↓
COMPARE
   ↓
VERIFY
   ↓
REPORT
```

The framework should not advertise:

```text
"2x FPS"
"GPU unlocked"
"RAM doubled"
"zero heat"
"real ray tracing"
"console graphics"
```

without reproducible evidence.

---

# Limitations

unrealX cannot create a graphics capability that the game, API, driver or GPU does not expose.

A root module cannot universally invent:

- new game textures
- new game geometry
- new shaders
- physically accurate water
- real hardware ray tracing
- unsupported rendering pipelines
- higher-quality source assets

For game-specific rendering controls:

```text
Game exposes setting?
      │
   YES ──► Validate and use when safe
      │
    NO
      │
      ▼
UNSUPPORTED → SKIP
```

This is intentional.

---

# Performance Design

Idle overhead is treated as a feature.

The runtime avoids:

```text
✗ busy loops
✗ aggressive process polling
✗ constant configuration writes
✗ unnecessary daemons
✗ repeated heavyweight hardware probing
✗ excessive WebUI refreshes
```

The preferred architecture is:

```text
EVENT / LOW-FREQUENCY SAMPLE
              ↓
         STATE CHANGE
              ↓
         POLICY UPDATE
              ↓
         WAIT / COOLDOWN
```

---

# Project Structure

```text
unrealX/
├── module.prop
├── customize.sh
├── post-fs-data.sh
├── service.sh
├── boot-completed.sh
├── action.sh
├── uninstall.sh
│
├── bin/
│   └── unrealX
│
├── core/
│   ├── common.sh
│   ├── config.sh
│   └── webstate.sh
│
├── detection/
│   ├── device.sh
│   ├── gpu.sh
│   ├── kernel.sh
│   ├── root_manager.sh
│   └── thermal.sh
│
├── graphics/
│   ├── water.sh
│   ├── sky.sh
│   ├── shadow.sh
│   ├── vegetation.sh
│   ├── texture.sh
│   └── color.sh
│
├── runtime/
│   ├── adaptive.sh
│   └── game-detector.sh
│
├── kernel/
│   ├── capabilities.sh
│   └── interface.sh
│
├── safety/
│   ├── validate.sh
│   └── permissions.sh
│
├── recovery/
│   ├── backup.sh
│   └── rollback.sh
│
├── profiles/
│   └── defaults.json
│
├── native/
│   └── unrealx_probe.c
│
├── rust/
│   ├── Cargo.toml
│   └── src/
│
├── webroot/
│   ├── index.html
│   ├── css/
│   ├── js/
│   ├── components/
│   └── assets/
│
├── assets/
│   ├── banner.png
│   ├── icon.png
│   ├── emoji/
│   └── emoji-original.zip
│
├── tests/
└── docs/
```

---

# Development Principles

Before adding an optimization:

```text
┌──────────────────────────────────────────────────────────────────────┐
│ WHAT DOES IT CHANGE?                                                 │
│                                                                      │
│ WHY DOES IT HELP?                                                    │
│                                                                      │
│ WHICH DEVICES SUPPORT IT?                                            │
│                                                                      │
│ HOW IS SUPPORT DETECTED?                                             │
│                                                                      │
│ HOW IS THE RESULT VERIFIED?                                          │
│                                                                      │
│ HOW IS IT ROLLED BACK?                                               │
└──────────────────────────────────────────────────────────────────────┘
```

If these answers cannot be established:

```text
DO NOT IMPLEMENT THE TWEAK
```

---

# Release Quality Gate

Every release should pass:

```text
╔══════════════════════════════════════════════════════════════════════╗
║                        unrealX RELEASE GATE                         ║
╠══════════════════════════════════════════════════════════════════════╣
║ [PASS] Module metadata                                                ║
║ [PASS] Lifecycle scripts                                              ║
║ [PASS] Shell syntax                                                   ║
║ [PASS] CLI                                                             ║
║ [PASS] Configuration validation                                       ║
║ [PASS] Root-manager detection                                         ║
║ [PASS] GPU detection                                                   ║
║ [PASS] Thermal detection                                               ║
║ [PASS] Recovery path                                                   ║
║ [PASS] WebUI entry point                                               ║
║ [PASS] WebUI assets                                                    ║
║ [PASS] Branding                                                        ║
║ [PASS] Archive integrity                                               ║
║ [PASS] Documentation                                                   ║
╚══════════════════════════════════════════════════════════════════════╝
```

A release being installable does not imply every optional capability is available on every Android device.

---

# Roadmap

```text
v1.x
│
├── More GPU capability matrices
├── Improved device profiles
├── More game profile adapters
├── Expanded thermal hysteresis
├── Improved runtime state reporting
├── More WebUI diagnostics
└── Better benchmark observability
```

Longer-term architecture can evolve toward:

```text
Hardware Capability Database
          │
          ▼
Per-GPU Profile Resolver
          │
          ▼
Per-Device Profile Resolver
          │
          ▼
Per-Game Profile Resolver
          │
          ▼
Measured Runtime Adaptation
```

Every new subsystem must preserve the same safety model.

---

# Contributing

Contributions are welcome.

Good contributions should be:

- measurable
- documented
- reversible
- hardware-aware
- testable
- minimally privileged
- free of placebo tweaks

Please include:

```text
Problem
↓
Technical cause
↓
Supported devices
↓
Implementation
↓
Verification
↓
Rollback behavior
↓
Tests
```

Pull requests that add generic "performance properties" without measurable technical justification should not be considered verified optimizations.

---

# Support and Community

<p align="center">
  <a href="https://t.me/uwEspresso">
    <img src="https://img.shields.io/badge/Telegram-Follow-white?style=for-the-badge&logo=telegram&logoColor=white&labelColor=222" alt="Telegram">
  </a>
  <a href="https://github.com/dreammwas/unrealX">
    <img src="https://img.shields.io/badge/GitHub-DREAM__WAS-white?style=for-the-badge&logo=github&logoColor=white&labelColor=222" alt="GitHub">
  </a>
  <a href="https://github.com/dreammwas/unrealX/issues">
    <img src="https://img.shields.io/badge/Issues-Report-white?style=for-the-badge&logo=github&logoColor=white&labelColor=222" alt="Issues">
  </a>
</p>

## Project Resources

- **GitHub:** https://github.com/dreammwas/unrealX
- **Releases:** https://github.com/dreammwas/unrealX/releases
- **Issues:** https://github.com/dreammwas/unrealX/issues
- **Pull Requests:** https://github.com/dreammwas/unrealX/pulls
- **Telegram:** https://t.me/uwEspresso

---

# Author

```text
╔══════════════════════════════════════════════════════════════════════╗
║                            DREAM_WAS                                 ║
╠══════════════════════════════════════════════════════════════════════╣
║ GitHub   : github.com/dreammwas                                      ║
║ Telegram : t.me/uwEspresso                                           ║
║ Project  : unrealX                                                    ║
╚══════════════════════════════════════════════════════════════════════╝
```

All unrealX project documentation, release metadata and branding should credit **DREAM_WAS** and link to the official project/community resources.

---

# License

unrealX is open-source software licensed under the **Apache License 2.0**.

See:

```text
LICENSE
```

for the complete license.

---

# Final Statement

```text
╔══════════════════════════════════════════════════════════════════════╗
║                                                                      ║
║                            unrealX                                   ║
║                                                                      ║
║      REALISTIC WHEN POSSIBLE. PERFORMANCE WHEN NEEDED.               ║
║                         SAFETY ALWAYS.                               ║
║                                                                      ║
║  Detect what exists.                                                 ║
║  Validate what is supported.                                         ║
║  Apply only what can be verified.                                    ║
║  Adapt when conditions change.                                       ║
║  Roll back when something is unsafe.                                 ║
║                                                                      ║
║             NEVER SACRIFICE DEVICE SAFETY FOR QUALITY.              ║
║                                                                      ║
╚══════════════════════════════════════════════════════════════════════╝
```

<p align="center">
  <strong>unrealX v1.0.0.0-r3</strong><br>
  Adaptive Visual Fidelity Engine for Android<br><br>
  <a href="https://github.com/dreammwas">DREAM_WAS</a> ·
  <a href="https://t.me/uwEspresso">uwEspresso</a>
</p>
