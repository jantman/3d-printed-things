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
