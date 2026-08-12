# Build

From the project root:

`./build.sh` creates the distributable ZIP.

`./test.sh` runs shell/config/packaging checks available on the host.

The baseline build requires only POSIX shell tooling and zip. Native C/Rust components are optional target-ABI source projects and are not compiled by default.
