#!/bin/bash

set -o errexit
set -o xtrace
cd "$( dirname "${BASH_SOURCE[0]}" )"

for i in half-lap*.scad depth*.scad; do
  openscad -o ${i}.stl -D'convert_to_mm=true' ${i}
  openscad -o ${i}.png --render=all ${i}
done
