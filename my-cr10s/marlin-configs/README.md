# my-cr10s/marlin-configs

My Marlin firmware configuration files. Currently using Marlin version specified in [marlin-version](marlin-version).

## Build Process

1. Update [marlin-version](marlin-version) if needed.
2. Update the various `.h` files in this directory as needed.
3. Commit and push.
4. The [Build Firmware GitHub Action](https://github.com/jantman/3d-printed-things/actions/workflows/build-firmware.yml) will build the firmware image, and make it available as a [Release](https://github.com/jantman/3d-printed-things/releases).
