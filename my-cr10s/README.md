# my-cr10s

My Creality CR-10S printer and related things.

## Contents

* [marlin-configs/](marlin-configs/) - my Marlin configuration files
* [models/](models/) - Complete 3D models of my printer and accessories. Unmaintained.
* [tests-and-troubleshooting/](tests-and-troubleshooting/) - Various test models such as calibration cubes

## Printer Information

* Creality CR-10S
* [BigTreeTech SKR Mini E3 V3.0](https://biqu.equipment/products/bigtreetech-skr-mini-e3-v2-0-32-bit-control-board-for-ender-3?variant=39982232174690) motherboard ([manual (PDF)](https://github.com/bigtreetech/BIGTREETECH-SKR-mini-E3/blob/master/hardware/BTT%20SKR%20MINI%20E3%20V3.0/Hardware/BTT%20SKR%20MINI%20E3%20V3.0%20user%20manual.pdf) and [hardware docs](https://github.com/bigtreetech/BIGTREETECH-SKR-mini-E3/tree/master/hardware/BTT%20SKR%20MINI%20E3%20V3.0/Hardware))
  * [BIGTREETECH E3 DCDC5V V1.0](https://biqu.equipment/products/bigtreetech-dcdc5v-v1-0-power-module-5v-for-skr-mini-e3-v1-2-skr-mini-e3-v3-0-32bit-control-board-rgb-light) 5V power supply module
* [Micro-Swiss Direct Drive extruder](https://store.micro-swiss.com/products/micro-swiss-direct-drive-extruder)
* [Micro-Swiss all metal hotend](https://store.micro-swiss.com/collections/all-metal-hotend-kits/products/all-metal-hotend-kit-for-cr-10) (aluminum heat break)
* [Micro-Swiss plater copper heater block](https://store.micro-swiss.com/collections/heater-blocks/products/micro-swiss-high-temperature-mk8-heater-block-upgrade)
* [MAXGLEE 70W/12V heater element](https://www.amazon.com/gp/product/B09LCDGH5Q/) good to 500°C
* [PT100 RTC hotend temperature sensor](https://www.amazon.com/gp/product/B08294HYVF/) (good to 450°C) with [Adafruit #3328 PT100 RTD Temperature Sensor Amplifier - MAX31865](https://www.adafruit.com/product/3328) solder-jumpered for 2-wire mode
  * Amplifier board docs: https://web.archive.org/web/20210725023757/https://e3d-online.dozuki.com/Wiki/E3D_PT100_Amplifier_Documentation
* Genuine [ANTCLabs BLTouch Smart V3.1](https://www.antclabs.com/bltouch-v3) bed leveling sensor
* [BigTreeTech SFS V1.0 Smart Filament Sensor](https://biqu.equipment/products/btt-sfs-v1-0-smart-filament-sensor-detection-stuck-blocking-filament-module?variant=31150666645602) ([docs](https://github.com/bigtreetech/smart-filament-detection-module))
* [BigTreeTech Direct TFT35 E3 V3.0.1 Display](https://biqu.equipment/products/btt-tft35-e3-v3-0-display-touch-screen-two-working-modes) ([docs](https://github.com/bigtreetech/BTT-TFT35-E3-V3.0))

## Hotend Wiring

* Fans are connected with JST SYP 2.54mm connectors to the factory leads, a few inches away from the hotend. Hotend fan has a male end and part cooling fan has a female end.
* Heater element is connected with a Mini Tamiya connector to the factory leads, a few inches away from the hotend.
* PT100 RTD temperature sensor is connected with a 2-pin, 2.54mm pitch JST SM connector to the factory leads, a few inches away from the hotend.

## Motherboard Wiring

* Stepper motors are connected as usual to `(X|Y|ZA|ZB|E)M` 4-pin headers
* X/Y/Z limit switches are connected as usual to the corresponding `(X|Y|Z)STOP` 2-pin headers
* +12V power in from the power supply is connected to the `DCIN` screw terminals. **Note** that from the factory, these are always a bit too short to easily remove the power supply to work on the board. I replaced the factory cables with custom ones of 16 AWG silicone-insulated wire, about 3 inches longer than factory, with spade tongue terminals crimped to the power supply end and ferrules on the board end.
* Bed temperature sensor (TB) plugged in to `THB` header
* Bed Heater leads to `HB` screw terminals
* Hotend heater leads to `HE0` screw terminals
* Part fan to `FAN0`
* Extrufer fan to `FAN1`
* Case fan to `FAN2`
* BLTouch is connected to the `Z-Probe` 5-pin port on the board
* Filament runout sensor is connected to `E0-STOP` (pin PC15)
* Front panel display/control board - `EXP3` on the display to `EXP1` on the board
* Install DCDC5V board.
* Move jumper to right of `Neopixel 1` plug, for external DCDC5V mode.
* Adafruit 3328 / MAX31865 per [this](https://github.com/bigtreetech/BIGTREETECH-SKR-mini-E3/issues/476#issuecomment-751288272) GitHub post ([JPG in this repo](max31865.jpg)), for Hardware SPI
  * TH1 to the inputs on the MAX31865
  * MAX31865 to main board as follows:
    * VIN to SPI1 +5V
    * GND to SPI1 GND
    * CLK to SPI1 CLK
    * SDO to SPI1 MISO
    * SDI to SPI1 MOSI
    * CS to TX2 (PA2; middle pin on TFT header)
* Neopixel1 wired to an external pigtail

### Analog Inputs

PA0 - TH0 (4.7k pullup)
PA1 - "SERVOS"
PA2 - TX2 (TFT header) - now used for MAX31865 CS pin
PA3 - RX2 (TFT header)
PA4 - CD-CS (SD card)
PA5 - SPI1-SCK (shared between SPI1 and SD card)
PA6 - SPI1-MISO (shared between SPI1 and SD card)
PA7 - SPI1-MOSI (shared between SPI1 and SD card)
PA8 - Neopixel
PA9 - TX1 (EXP1 for display)
PA10 - RX1 (EXP1 for display)
PA11 (PA9) - USB N
PA12 (PA10) - USB P
PA13 - SWDIO (J11 "SWD"; 10k pullup)
PA14 (BOOT0) - SWCLK (J11 "SWD"; 10k pulldown)
PA15 - BTN-ENC (EXP1 pin 9; display button/rotary encoder)

## BLTouch Setup

1. Send [M420](https://marlinfw.org/docs/gcode/M420.html) S0 to turn off bed leveling.
2. Send [M111 247](https://marlinfw.org/docs/gcode/M111.html) to turn on debug logging via the terminal.
3. Send [G28](https://marlinfw.org/docs/gcode/G028.html) to auto-home.
4. Send [G29](https://marlinfw.org/docs/gcode/G029.html) to begin bed leveling.
5. Send [G29 P0](https://marlinfw.org/docs/gcode/G029.html) to zero the mesh data and then [G29 P1](https://marlinfw.org/docs/gcode/G029.html) to start Phase 1 bed leveling; this may take a while, as it probes up to 100 points.
6. Send [G29 P3](https://marlinfw.org/docs/gcode/G029.html) to interpolate the rest of the points. Repeat as needed until the mesh is complete.
7. Set the Z Offset using the Probe Offset Wizard in Marlin:
    1. Heat build plate to 55 and nozzle to 210 (about average temperatures for me).
    2. Use the Probe Offset Wizard on the LCD:
        1. Go to Configuration – Advanced Settings – Probe Offsets – Z Prob Wizard
        2. Select Move 0.1mm
        3. Lower the z-axis by 0.1mm until you get to paper height from the build plate
        4. Closeout of that Move 0.1mm window
        5. Select Done
    3. That gets me to a probe offset of -0.25. Running `M503` confirms that: `Recv: echo:  M851 X-44.00 Y-9.00 Z-0.25 ; (mm)`
    4. Ok, let's save those settings: [M500](https://marlinfw.org/docs/gcode/M500.html)
8. Run `G29 S0` to save the mesh to the first storage slot.
9. Home the machine ([G28](https://marlinfw.org/docs/gcode/G028.html)), set it back to relative positioning ([G91](https://marlinfw.org/docs/gcode/G091.html)), and try a test print. Maybe the best print to do is the Marlin built-in Mesh Validation pattern, which can be printed with [G26](https://marlinfw.org/docs/gcode/G026.html).
10. Update OctoPrint and Cura scripts (see below). Install the [Bed Visualizer](https://plugins.octoprint.org/plugins/bedlevelvisualizer/) plugin in OctoPrint, update its GCode as shown below, and run it to see what your bed mesh looks like.
