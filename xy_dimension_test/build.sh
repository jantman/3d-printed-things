#!/bin/bash

set -o errexit
set -o xtrace
cd "$( dirname "${BASH_SOURCE[0]}" )"

openscad -o dimension_test.stl dimension_test.scad

echo "In cura, move the model to X=-2 Y=8"
