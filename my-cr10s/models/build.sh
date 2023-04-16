#!/bin/bash

set -o errexit
set -o xtrace

cd "$( dirname "${BASH_SOURCE[0]}" )"
[[ -e output/printer.stl ]] || time openscad -o output/printer.stl -D'show_printer=true' -D'show_control_box=false' CR-10.STEP.scad
# Note - output/printer.stl is 162MB. It's currently gitignored.
[[ -e output/printer_fixed.stl ]] || admesh --write-binary-stl=output/printer_fixed.stl output/printer.stl
if [[ ! -e output/printer_fixed_shell.stl ]]; then
  meshlabserver -i output/printer_fixed.stl -o output/printer_fixed_shell.stl -s output/make_shell.mlx
fi

[[ -e output/control_box.stl ]] || time openscad -o output/control_box.stl -D'show_printer=false' -D'show_control_box_shell=true' -D'show_control_box_details=false' -D'show_spool_holder=false' CR-10.STEP.scad
[[ -e output/control_box_fixed.stl ]] || admesh --write-binary-stl=output/control_box_fixed.stl output/control_box.stl
