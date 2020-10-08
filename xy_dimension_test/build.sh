#!/bin/bash

set -o errexit
set -o xtrace
cd "$( dirname "${BASH_SOURCE[0]}" )"

openscad -o dimension_test.stl dimension_test.scad

echo "In cura, ensure the printer Y (Depth) is set to 300"
echo "In cura, move the model to X=-5 Y=7"
