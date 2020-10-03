#!/bin/bash

set -o errexit

cd "$( dirname "${BASH_SOURCE[0]}" )"
[[ -e output/printer.stl ]] || time openscad -o output/printer.stl -D'show_printer=true' -D'show_control_box=false' CR-10.STEP.scad
# Note - output/printer.stl is 162MB. It's currently gitignored.
[[ -e output/printer_fixed.stl ]] || admesh --write-binary-stl=output/printer_fixed.stl output/printer.stl
if [[ ! -e output/printer_fixed_meshlab_shell.stl ]]; then
  meshlabserver -i output/printer_fixed.stl -o output/printer_fixed_shell.stl -s output/make_shell.mlx
fi

#time openscad -o output/control_box.stl -D'show_printer=false' -D'show_control_box=true' CR-10.STEP.scad
#admesh --write-binary-stl=output/control_box_fixed.stl output/control_box.stl
