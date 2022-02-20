# 3d-printed-things

[![Project Status: Unsupported – The project has reached a stable, usable state but the author(s) have ceased all work on it. A new maintainer may be desired.](https://www.repostatus.org/badges/latest/unsupported.svg)](https://www.repostatus.org/#unsupported)

Collection of things I've 3d printed and might want to print again.

Files under [backup/](backup/) are backups/mirrors of things I've printed before and might want to again, even if their current hosting/location disappears. Please see the directories and/or source links for attribution and license.

Files under other directories are remixes/forks (see their README files for details, attribution, or licenses) or my own work.

Files which are my own work are licensed under [CERN-OHL-W v2](https://ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-version-2).

## 3/4" Square Tube Connector

[3-4_inch_tube_connector/](3-4_inch_tube_connector/) - A part to connect two pieces of 3/4" aluminum square tubing

## 60mm Fan Blower

[60mm_fan_blower/](60mm_fan_blower/) - A part to allow snapping in a 60mm fan and converting it to a round ~7/8" outlet for use as a blower.

## Air Tool Connector Dust Cover

[air-connector-dust-cover/](air-connector-dust-cover/) - A dust cover for standard 1/4" Industrial (a.k.a "I/M" or "Milton M-style" or "Type D") air tool connectors.

## Half-Lap Templates

[half_lap_templates/](half_lap_templates/) - A set of templates for marking half-lap joints on dimensional lumber (currently US 2x4's), along with blocks for setting depth stops on saws and routers.

## Keyboard Cover

[keyboard-cover/](keyboard-cover/) - A cover for a Leopold FC200RT/KB "tenkeyless" mechanical keyboard.

## My CR-10S Printer

[my-cr10s/](my-cr10s/) - a complete 3D model of my CR-10S printer, as currently equipped, minus wires and filament.

## Pegboard Accessories

[pegboard/](pegboard/) - A collection of holders for US standard 1"-on-center pegboard.

## SharpWriter Center Finder

[sharpwriter_center_finder/](sharpwriter_center_finder) - A "center finder" jig for marking the center of boards, sized to fit a PaperMate SharpWriter pencil.

## Stencils

[stencils/](stencils/) - Some stencils for use with spray paint.

## XY Dimension Test

[xy_dimension_test/](xy_dimension_test/) - Various test prints for determining maximum printable size / XY dimensions.

## STEP to STL to SCAD conversion

[step-to-objects-stl.py](step-to-objects-stl.py) is a Python script that I wrote to allow working with the objects contained in STEP files from within OpenSCAD. It utilizes FreeCAD as an intermediary. The script:

1. Opens FreeCAD and loads the specified STEP file.
2. Identifies each object (PartFeature) in the imported file, hierarchically, and exports each one as its own STL file in a directory structure matching the STEP hierarchy.
3. Generates a ``.scad`` file with ``import()`` statements for every one of the STL files. If color information (DiffuseColor) was present on the part, that is preserved in the SCAD file by wrapping the ``import()`` statement with ``color()``.

The resulting SCAD file should allow you to work with each part that was present in the original STEP independently in OpenSCAD, i.e. moving parts around, hiding them, swapping them out for different parts, etc.

## Identifying bad STL files

[find_bad_stl.py](find_bad_stl.py) is a Python script to aid in identifying problematic STL files. It either takes a list of STL file paths, or finds all STL files under the current directory, recursively. For each file it:

1. If the [admesh](https://github.com/admesh/admesh/) binary can be found, it first rewrites the STL file with that program, fixing all problems that admesh can fix.
2. loads the mesh from the STL file in Python, and finds the bounding box (min and max x, y, z) for the object.
3. generates a SCAD file that ``import``s the STL four times; once as-is with colors, rotation, and translation applied, once unioned with a cube, once differenced with a cube, and once intersected with a cube.
4. runs ``openscad`` on this generated file, in command-line STL export mode.

The union/difference/intersection with a cube causes OpenSCAD to have CGAL compile the object. Any STL files which caused OpenSCAD to fail (exit non-zero) during the attempted union/difference/intersection operations or rendering to STL, are appended to a "failed" list and output at the end of the run.

This script is extremely helpful if you have a SCAD file that imports many, many STLs and won't render.
