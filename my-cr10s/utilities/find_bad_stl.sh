#!/bin/bash
# This optionally depends on admesh: https://github.com/admesh/admesh/

cd "$( dirname "${BASH_SOURCE[0]}" )/.."

scadfile=$(mktemp --suffix=.scad)
outfile=$(mktemp --suffix=.stl)
ADMESH_BIN=$(which admesh)
function finish {
  rm -f $scadfile $outfile
}
trap finish EXIT

failed=""

shopt -s globstar
for i in **/*.stl; do # Whitespace-safe and recursive
    fpath=$(readlink -f "$i")
    if [[ "$(file $fpath)" == *ASCII\ text ]]; then
      echo "Checking $i (ASCII)"
      [ "$ADMESH_BIN" != "" ] && admesh --write-ascii-stl=$fpath $fpath
    else
      echo "Checking $i (binary)"
      [ "$ADMESH_BIN" != "" ] && admesh --write-binary-stl=$fpath $fpath
    fi
    echo -e "import(\"${fpath}\");\n" > $scadfile
    if ! openscad --hardwarnings -o $outfile $scadfile
    then
      echo "FAILED: ${i}"
      failed="${failed}\n${i}"
      continue
    fi
done

echo "FAILED STL FILES:"
echo $failed

#set -x
#openscad --hardwarnings -o $outfile -D'show_control_box=false' -D'show_printer=true' CR-10.STEP.scad || exit 1
#openscad --hardwarnings -o $outfile -D'show_control_box=true' -D'show_printer=false' CR-10.STEP.scad || exit 1
#have_camera_mount = false;
#have_pi_case = false;
#have_microswiss = false;
#have_z_cable_management = false;
#have_y_cable_management = false;
#have_x_cable_management = false;
#show_control_box = false;
#show_printer = true;
#show_slide_plate_assembly = true;
#exit 0
