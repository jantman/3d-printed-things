#!/bin/bash

set -o errexit
set -o xtrace
cd "$( dirname "${BASH_SOURCE[0]}" )"

openscad -o half-lap_wide-wide_end.scad.stl -D'convert_to_mm=true' half-lap_wide-wide_end.scad
