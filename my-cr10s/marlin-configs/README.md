# my-cr10s/marlin-configs

My Marlin firmware configuration files. Currently using Marlin version specified in [marlin-version](marlin-version).

## Build Process

1. Update [marlin-version](marlin-version) if needed.
2. Update the various `.h` files in this directory as needed.
3. Commit and push.
4. The [Build Firmware GitHub Action](https://github.com/jantman/3d-printed-things/actions/workflows/build-firmware.yml) will build the firmware image, and make it available as a [Release](https://github.com/jantman/3d-printed-things/releases).

## Firmware Flashing - Initial Flash on New Board

For the time being, let's just use the sdcard `firmware.bin` process to flash the board. If I end up doing this often, I can always try [OctoPrint-FirmwareUpdater with MarlinBFT](https://github.com/OctoPrint/OctoPrint-FirmwareUpdater/blob/master/doc/marlinbft.md)
