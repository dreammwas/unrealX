# Kernel interface policy

The kernel layer is capability-based. Each interface is evaluated as SUPPORTED, UNSUPPORTED, BLOCKED, or UNKNOWN. UNKNOWN is treated as no permission to write. No scheduler, frequency, voltage, memory, thermal-limit, or SELinux policy is modified by the v1.0.0.0 baseline.
