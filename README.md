# 3d-printed-things

Collection of things I've 3d printed and might want to print again.

Files under [backup/](backup/) are backups/mirrors of things I've printed before and might want to again, even if their current hosting/location disappears. Please see the directories and/or source links for attribution and license.

Files under other directories are remixes/forks (see their README files for details, attribution, or licenses) or my own work.

Files which are my own work are licensed under [CERN-OHL-W v2](https://ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-version-2).

## My CR-10S Printer

[my-cr10s/](my-cr10s/) contains a complete 3D model of my CR-10S printer, as currently equipped, minus wires and filament.

## STEP to STL to SCAD conversion

[step-to-objects-stl.py](step-to-objects-stl.py) is a Python script that I wrote to allow working with the objects contained in STEP files from within OpenSCAD. It utilizes FreeCAD as an intermediary. The script:

1. Opens FreeCAD and loads the specified STEP file.
2. Identifies each object (PartFeature) in the imported file, hierarchically, and exports each one as its own STL file in a directory structure matching the STEP hierarchy.
3. Generates a ``.scad`` file with ``import()`` statements for every one of the STL files. If color information (DiffuseColor) was present on the part, that is preserved in the SCAD file by wrapping the ``import()`` statement with ``color()``.

The resulting SCAD file should allow you to work with each part that was present in the original STEP independently in OpenSCAD, i.e. moving parts around, hiding them, swapping them out for different parts, etc.
