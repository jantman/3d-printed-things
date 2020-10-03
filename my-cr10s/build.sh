#!/bin/bash

set -o errexit

cd "$( dirname "${BASH_SOURCE[0]}" )"
time openscad -o output/printer.stl -D'show_printer=true' -D'show_control_box=false' CR-10.STEP.scad
# Note - output/printer.stl is 162MB. It's currently gitignored.
admesh --write-binary-stl=output/printer_fixed.stl output/printer.stl

time openscad -o output/control_box.stl -D'show_printer=false' -D'show_control_box=true' CR-10.STEP.scad
admesh --write-binary-stl=output/control_box_fixed.stl output/control_box.stl
