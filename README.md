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

## Blast Gate Switch Mount

[blast_gate_switch_mount/](blast_gate_switch_mount/) - A 3d printed piece to mount a miniature snap-action switch on plastic 4" dust collection blast gates such as those sold by PowerTec and Fulton Woodworking.

## Cabinet Spacer

[cabinet-spacer/](cabinet-spacer/) - Spacer for assembling cabinets that need a 9/16" gap maintained between them.

## Dremel Grinding Stone Holder

[dremel-grinding-stone-holder/](dremel-grinding-stone-holder/) - A block with holes in it, to hold a set of 56 1/8" (3mm) shaft grinding stones, such as for a Dremel tool. Designed for stones up to 12mm (~1/2") diameter.

## ESP32 Boxes

[esp32-boxes/](esp32-boxes/) - Various boxes for projects using the ESP32 microcontroller.

## Half-Lap Templates

[half_lap_templates/](half_lap_templates/) - A set of templates for marking half-lap joints on dimensional lumber (currently US 2x4's), along with blocks for setting depth stops on saws and routers.

## Keyboard Cover

[keyboard-cover/](keyboard-cover/) - A cover for a Leopold FC200RT/KB "tenkeyless" mechanical keyboard.

## Limit Switch Brackets

[limit-switch-brackets/](limit-switch-brackets/) - Some brackets for mounting generic limit switches.

## My CR-10S Printer

[my-cr10s/](my-cr10s/) - a complete 3D model of my CR-10S printer, as currently equipped, minus wires and filament. Plus components I've printed for it, my Marlin firmware configs, test/troubleshooting prints, etc.

## Neopixel Mounts

[neopixel-mounts/](neopixel-mounts/) - Various 3d printer mounts for Neopixels and similar LEDs.

## Pegboard Accessories

[pegboard/](pegboard/) - A collection of holders for US standard 1"-on-center pegboard.

## R8 Collet Holders and Similar

[R8_collet_holders/](R8_collet_holders/) - Some R8 collet holders and related things intended to sit in a drawer and connect together with dovetails.

## Sengled Zigbee Remote Wall Plate

[sengled_zigbee_remote_wall_plate/](sengled_zigbee_remote_wall_plate/) - Standard US-style toggle light switch wall plate that holds a [Sengled E39-G8C](https://smile.amazon.com/gp/product/B07QHDV5S4/) Zigbee remote control in front of the toggle switch, but lets you access the switch by sliding the remote out.

## SharpWriter Center Finder

[sharpwriter_center_finder/](sharpwriter_center_finder) - A "center finder" jig for marking the center of boards, sized to fit a PaperMate SharpWriter pencil.

## Stencils

[stencils/](stencils/) - Some stencils for use with spray paint.

## Tape Measure Wall Holder

[tape_measure_wall_holder/](tape_measure_wall_holder/) - Hinged plate to hold the end of a tape measure 3.5" or 4.5" in from the edge of floor decking, for marking wall locations.

## Temperature Towers

[temp-tower/](temp-tower/) generator and models

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
