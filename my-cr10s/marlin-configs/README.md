# my-cr10s/marlin-configs

Notes for [[BUG] MAX31865 temperature Hardware SPI not working on BTT SKR Mini E3 V3 · Issue #25774 · MarlinFirmware/Marlin](https://github.com/MarlinFirmware/Marlin/issues/25774)

## Debug Output When Broken

Console output from https://github.com/jantman/3d-printed-things/commit/2cd90e939cd3b5a08e966b701b748222b113b57b

```
Recv: Init MAX31865 Hardware SPI
Recv: MAX31865 Regs: CFG 255|RTD 65535|HTHRS 65535|LTHRS 65535|FLT  255
Recv: MAX31865 ignoring fault 1
Recv: RTD MSB:255  RTD LSB:254
Recv: Regular begin call with cselPin: 194 misoPin: 255 sclkPin: 255 mosiPin: 255 config: 255
[...]
Recv: MAX31865 RTD MSB:255 LSB:255
Recv: MAX31865 ignoring fault 2
Send: N1 M115*39
Recv: FIRMWARE_NAME:Marlin build32_2cd90e9 (May  2 2023 21:42:18) SOURCE_CODE_URL:github.com/jantman/3d-printed-things my-cr10s/marlin-configs PROTOCOL_VERSION:1.0 MACHINE_TYPE:CR-10S EXTRUDER_COUNT:1 UUID:cede2a2f-41a2-4748-9b12-c55c62f367ff
Recv: Cap:SERIAL_XON_XOFF:0
Recv: Cap:BINARY_FILE_TRANSFER:0
Recv: Cap:EEPROM:1
Recv: Cap:VOLUMETRIC:1
Recv: Cap:AUTOREPORT_POS:1
Recv: Cap:AUTOREPORT_TEMP:1
Recv: Cap:PROGRESS:0
Recv: Cap:PRINT_JOB:1
Recv: Cap:AUTOLEVEL:1
Recv: Cap:RUNOUT:1
Recv: Cap:Z_PROBE:1
Recv: Cap:LEVELING_DATA:1
Recv: Cap:BUILD_PERCENT:1
Recv: Cap:SOFTWARE_POWER:0
Recv: Cap:TOGGLE_LIGHTS:0
Recv: Cap:CASE_LIGHT_BRIGHTNESS:0
Recv: Cap:EMERGENCY_PARSER:1
Recv: Cap:HOST_ACTION_COMMANDS:1
Recv: Cap:PROMPT_SUPPORT:1
Recv: Cap:SDCARD:0
Recv: Cap:REPEAT:0
Recv: Cap:SD_WRITE:0
Recv: Cap:AUTOREPORT_SD_STATUS:0
Recv: Cap:LONG_FILENAME:0
Recv: Cap:LFN_WRITE:0
Recv: Cap:CUSTOM_FIRMWARE_UPLOAD:0
Recv: Cap:EXTENDED_M20:0
Recv: Cap:THERMAL_PROTECTION:1
Recv: Cap:MOTION_MODES:0
Recv: Cap:ARCS:1
Recv: Cap:BABYSTEPPING:1
Recv: Cap:CHAMBER_TEMPERATURE:0
Recv: Cap:COOLER_TEMPERATURE:0
Recv: Cap:MEATPACK:0
Recv: Cap:CONFIG_EXPORT:0
[...]
Recv: MAX31865 RTD MSB:255 LSB:255
Recv: MAX31865 ignoring fault 3
Recv: MAX31865 RTD MSB:255 LSB:255
Recv: MAX31865 ignoring fault 4
Recv: MAX31865 RTD MSB:255 LSB:255
Recv: MAX31865 ignoring fault 5
Recv: MAX31865 RTD MSB:255 LSB:255
Recv: MAX31865 ignoring fault 6
Recv: MAX31865 RTD MSB:255 LSB:255
Recv: MAX31865 ignoring fault 7
```

## Output When Fixed with Software SPI

Issue was fixed by switching to software SPI - see https://github.com/jantman/3d-printed-things/tree/71fedd2ea95d96765beeb07b31b1e1b0934c4248/my-cr10s/marlin-configs ([diff that fixed it](https://github.com/jantman/3d-printed-things/compare/2cd90e939cd3b5a08e966b701b748222b113b57b..71fedd2ea95d96765beeb07b31b1e1b0934c4248))

Console output when working:

```
Recv: Initializing MAX31865 Software SPI
Recv: MAX31865 Regs: CFG 0|RTD 0|HTHRS 65535|LTHRS 0|FLT  0
Recv: RTD MSB:65  RTD LSB:108
Recv: Regular begin call with cselPin: 194 misoPin: 198 sclkPin: 197 mosiPin: 199 config: 0
[...]
Recv: MAX31865 bias voltage enabled
[...]
Send: N1 M115*39
Recv: FIRMWARE_NAME:Marlin build34_71fedd2 (May  2 2023 21:59:45) SOURCE_CODE_URL:github.com/jantman/3d-printed-things my-cr10s/marlin-configs PROTOCOL_VERSION:1.0 MACHINE_TYPE:CR-10S EXTRUDER_COUNT:1 UUID:cede2a2f-41a2-4748-9b12-c55c62f367ff
Recv: Cap:SERIAL_XON_XOFF:0
Recv: Cap:BINARY_FILE_TRANSFER:0
Recv: Cap:EEPROM:1
Recv: Cap:VOLUMETRIC:1
Recv: Cap:AUTOREPORT_POS:1
Recv: Cap:AUTOREPORT_TEMP:1
Recv: Cap:PROGRESS:0
Recv: Cap:PRINT_JOB:1
Recv: Cap:AUTOLEVEL:1
Recv: Cap:RUNOUT:1
Recv: Cap:Z_PROBE:1
Recv: Cap:LEVELING_DATA:1
Recv: Cap:BUILD_PERCENT:1
Recv: Cap:SOFTWARE_POWER:0
Recv: Cap:TOGGLE_LIGHTS:0
Recv: Cap:CASE_LIGHT_BRIGHTNESS:0
Recv: Cap:EMERGENCY_PARSER:1
Recv: Cap:HOST_ACTION_COMMANDS:1
Recv: Cap:PROMPT_SUPPORT:1
Recv: Cap:SDCARD:0
Recv: Cap:REPEAT:0
Recv: Cap:SD_WRITE:0
Recv: Cap:AUTOREPORT_SD_STATUS:0
Recv: Cap:LONG_FILENAME:0
Recv: Cap:LFN_WRITE:0
Recv: Cap:CUSTOM_FIRMWARE_UPLOAD:0
Recv: Cap:EXTENDED_M20:0
Recv: Cap:THERMAL_PROTECTION:1
Recv: Cap:MOTION_MODES:0
Recv: Cap:ARCS:1
Recv: Cap:BABYSTEPPING:1
Recv: Cap:CHAMBER_TEMPERATURE:0
Recv: Cap:COOLER_TEMPERATURE:0
Recv: Cap:MEATPACK:0
Recv: Cap:CONFIG_EXPORT:0
[...]
Recv: MAX31865 1 shot mode enabled
Recv: MAX31865 RTD MSB:65 LSB:112
Recv: MAX31865 bias voltage enabled
Recv: MAX31865 1 shot mode enabled
Recv: MAX31865 RTD MSB:65 LSB:114
Recv: MAX31865 bias voltage enabled
Recv:  T:25.50 /0.00 (8377.00) B:22.00 /0.00 (3927.19) @:0 B@:0
Recv: MAX31865 1 shot mode enabled
Recv: MAX31865 RTD MSB:65 LSB:112
Recv: MAX31865 bias voltage enabled
Recv: MAX31865 1 shot mode enabled
Recv: MAX31865 RTD MSB:65 LSB:114
Recv: MAX31865 bias voltage enabled
Recv:  T:25.50 /0.00 (8377.00) B:21.93 /0.00 (3927.63) @:0 B@:0
Recv: MAX31865 1 shot mode enabled
Recv: MAX31865 RTD MSB:65 LSB:116
Recv: MAX31865 bias voltage enabled
Recv: MAX31865 1 shot mode enabled
Recv: X:4.00 Y:2.00 Z:0.00 E:0.00 Count X:320 Y:160 Z:0
Recv: MAX31865 RTD MSB:65 LSB:116
Recv: MAX31865 bias voltage enabled
Recv: MAX31865 1 shot mode enabled
Recv:  T:25.53 /0.00 (8378.00) B:22.33 /0.00 (3925.06) @:0 B@:0
Recv: MAX31865 RTD MSB:65 LSB:116
Recv: MAX31865 bias voltage enabled
Recv: MAX31865 1 shot mode enabled
Recv: MAX31865 RTD MSB:65 LSB:118
Recv: MAX31865 bias voltage enabled
Recv: MAX31865 1 shot mode enabled
Recv:  T:25.57 /0.00 (8379.00) B:22.09 /0.00 (3926.63) @:0 B@:0
Recv: MAX31865 RTD MSB:65 LSB:118
Recv: MAX31865 bias voltage enabled
Recv: MAX31865 1 shot mode enabled
Recv: MAX31865 RTD MSB:65 LSB:118
Recv: MAX31865 bias voltage enabled
Recv: MAX31865 1 shot mode enabled
Recv: X:4.00 Y:2.00 Z:0.00 E:0.00 Count X:320 Y:160 Z:0
Recv:  T:25.57 /0.00 (8379.00) B:21.91 /0.00 (3927.75) @:0 B@:0
Recv: MAX31865 RTD MSB:65 LSB:118
Recv: MAX31865 bias voltage enabled
Recv: MAX31865 1 shot mode enabled
Recv: MAX31865 RTD MSB:65 LSB:116
Recv: MAX31865 bias voltage enabled
Recv: MAX31865 1 shot mode enabled
Recv:  T:25.53 /0.00 (8378.00) B:22.15 /0.00 (3926.25) @:0 B@:0
```
