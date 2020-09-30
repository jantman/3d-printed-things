# my-cr10s

This directory contains complete 3D models of my Creality CR-10S printer, as equipped, minus wires and filament.

## Contents

* [Creality_CR-10/](Creality_CR-10/) - git submodule pulling in Creality's [CR-10 open-source hardware drawings](https://github.com/Creality3DPrinting/CR-10), licensed under GPLv3.
* [CR-10/](CR-10/) - STL files from the Creality model, exported using my [step-to-objects-stl.py](../README.md#step-to-stl-to-scad-conversion) script and utilized by ``CR-10.STEP.scad``
* [CR-10.STEP.scad](CR-10.STEP.scad) - OpenSCAD file of my CR-10S, using the above resources

## Sources and Acknowledgements

This model is largely based on the work of others, to whom I am deeply grateful:

* Creality's [CR-10 open-source hardware drawings](https://github.com/Creality3DPrinting/CR-10), licensed under GPLv3 and imported using my [step-to-objects-stl.py](../README.md#step-to-stl-to-scad-conversion) script.
* [Cornelius Cool](https://www.thingiverse.com/cornely_cool)'s [CR-10 OEM - Complete 3D Model (Thingiverse)](https://www.thingiverse.com/thing:3176643) which I used to reference the dual Z setup.
* [Larry Ludlow](https://www.thingiverse.com/madbuda)'s [Micro Swiss Direct Drive](https://www.thingiverse.com/thing:4170190) carriage model.
* The various components I've used as accessories:
  * [../backup/cr10/CR10_Camera_Bracket_Thingiverse_4279932/](../backup/cr10/CR10_Camera_Bracket_Thingiverse_4279932/) - CR10 Camera Bracket by fellini on Thingiverse: https://www.thingiverse.com/thing:4279932
  * [../backup/cr10/IR-Pi_Cam_Prusa_i3_MK3MK3s_Camera_mount_Swivel_Package_Thingiverse_2873677](../backup/cr10/IR-Pi_Cam_Prusa_i3_MK3MK3s_Camera_mount_Swivel_Package_Thingiverse_2873677) - https://www.thingiverse.com/thing:2873677
  * [../backup/raspberry_pi_cases/Raspberry_Pi_4_Case_for_3D_Printer_Thingiverse_4309828](../backup/raspberry_pi_cases/Raspberry_Pi_4_Case_for_3D_Printer_Thingiverse_4309828) - Raspberry Pi 4 Case for 3D Printer, Multiple Options by Mattwall on Thingiverse: https://www.thingiverse.com/thing:4309828
  * [Creality CR-10 Y axis cable drag chain](https://www.thingiverse.com/thing:2708420) by [stevenfayers](https://www.thingiverse.com/stevenfayers), licensed under the [Creative Commons - Attribution license](http://creativecommons.org/licenses/by/3.0/).
  * [Creality CR-10 Z axis cable drag chain](https://www.thingiverse.com/thing:2757810) by [stevenfayers](https://www.thingiverse.com/stevenfayers), licensed under the Creative Commons license.
  * [Creality CR-10 X axis cable drag chain](http://www.thingiverse.com/thing:2923095) by [stevenfayers](https://www.thingiverse.com/stevenfayers), licensed under the [Creative Commons - Attribution license](http://creativecommons.org/licenses/by/3.0/).
* The X-axis carriage cable management I'm using is a remix of the X-axis carriage bracket from [stevenfayers' Creality CR-10 X axis cable drag chain](http://www.thingiverse.com/thing:2923095) and the Micro-Swiss clip bracket from [Ender 3 x Micro Swiss Direct Drive Cable Chain Gantry Mounts by SnowmanTechie](https://www.thingiverse.com/thing:4563903).
