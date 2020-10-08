#!/bin/bash

set -o errexit
set -o xtrace
cd "$( dirname "${BASH_SOURCE[0]}" )"

openscad -o dimension_test.stl dimension_test.scad
openscad -o really_big_square.stl really_big_square.scad
