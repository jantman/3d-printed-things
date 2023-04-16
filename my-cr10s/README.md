# my-cr10s

My Creality CR-10S printer and related things.

## Printer Information

* Creality CR-10S
* [BigTreeTech SKR Mini E3 V3.0](https://biqu.equipment/products/bigtreetech-skr-mini-e3-v2-0-32-bit-control-board-for-ender-3?variant=39982232174690) motherboard ([manual (PDF)](https://github.com/bigtreetech/BIGTREETECH-SKR-mini-E3/blob/master/hardware/BTT%20SKR%20MINI%20E3%20V3.0/Hardware/BTT%20SKR%20MINI%20E3%20V3.0%20user%20manual.pdf) and [hardware docs](https://github.com/bigtreetech/BIGTREETECH-SKR-mini-E3/tree/master/hardware/BTT%20SKR%20MINI%20E3%20V3.0/Hardware))
  * [BigTreeTech DCDC Mode V1.0](https://biqu.equipment/products/bigtreetech-dcdc5v-v1-0-power-module-5v-for-skr-mini-e3-v1-2-skr-mini-e3-v3-0-32bit-control-board-rgb-light) 5V power supply module
* [Micro-Swiss Direct Drive extruder](https://store.micro-swiss.com/products/micro-swiss-direct-drive-extruder)
* [Micro-Swiss all metal hotend](https://store.micro-swiss.com/collections/all-metal-hotend-kits/products/all-metal-hotend-kit-for-cr-10) (aluminum heat break)
* [Micro-Swiss plater copper heater block](https://store.micro-swiss.com/collections/heater-blocks/products/micro-swiss-high-temperature-mk8-heater-block-upgrade)
* [MAXGLEE 70W/12V heater element](https://www.amazon.com/gp/product/B09LCDGH5Q/) good to 500°C
* [PT100 RTC hotend temperature sensor](https://www.amazon.com/gp/product/B08294HYVF/) (good to 450°C) with [E3D E-BOARD-PT100 amplifier board](https://e3d-online.com/products/pt100-amplifier-board)
  * Amplifier board docs: https://web.archive.org/web/20210725023757/https://e3d-online.dozuki.com/Wiki/E3D_PT100_Amplifier_Documentation
* Genuine [ANTCLabs BLTouch Smart V3.1](https://www.antclabs.com/bltouch-v3) bed leveling sensor
* [BigTreeTech SFS V1.0 Smart Filament Sensor](https://biqu.equipment/products/btt-sfs-v1-0-smart-filament-sensor-detection-stuck-blocking-filament-module?variant=31150666645602)
* [BigTreeTech Direct TFT35 E3 V3.0.1 Display](https://biqu.equipment/products/btt-tft35-e3-v3-0-display-touch-screen-two-working-modes) ([docs](https://github.com/bigtreetech/BTT-TFT35-E3-V3.0))

## Hotend Wiring

* Fans are connected with JST SYP 2.54mm connectors to the factory leads, a few inches away from the hotend. Hotend fan has a male end and part cooling fan has a female end.
* Heater element is connected with a Mini Tamiya connector to the factory leads, a few inches away from the hotend.
* PT100 RTD temperature sensor is connected with a 2-pin, 2.54mm pitch JST SM connector to the factory leads, a few inches away from the hotend.

## Motherboard Wiring

* Stepper motors are connected as usual to `(X|Y|ZA|ZB|E)M` 4-pin headers
* X/Y/Z limit switches are connected as usual to the corresponding `(X|Y|Z)STOP` 2-pin headers
* +12V power in from the power supply is connected to the `DCIN` screw terminals. **Note** that from the factory, these are always a bit too short to easily remove the power supply to work on the board. I replaced the factory cables with custom ones of 16 AWG silicone-insulated wire, about 3 inches longer than factory, with spade tongue terminals crimped to the power supply end and ferrules on the board end.
* "TH1" hotend temp sensor **TBD**
* Bed temperature sensor (TB) plugged in to `THB` header
* Bed Heater leads to `HB` screw terminals
* Hotend heater leads to `HE0` screw terminals
* Part fan to `FAN0`
* Extrufer fan to `FAN1`
* Case fan to `FAN2`
* BLTouch is connected to the "Z-Probe" 5-pin port on the board
* Filament runout sensor is connected to **TBD**
* Front panel display/control board - EXP3 on the display to EXP1 on the board
* ~~Move jumper to right of `Neopixel 1` plug, for external DCDC5V mode.~~

## Contents

* [marlin-configs/](marlin-configs/) - my Marlin configuration files
* [models/](models/) - Complete 3D models of my printer and accessories. Unmaintained.
* [tests-and-troubleshooting/](tests-and-troubleshooting/) - Various test models such as calibration cubes
