# github.com/jantman/3d-printed-things temp-tower

This directory contains [temp-tower.py](temp-tower.py), a Python script that uses [PyMesh](https://github.com/PyMesh/PyMesh) to generate temperature tower STL files along with slicing instructions for them. The individual STL files used to build the tower are thanks to [gaaZolee](https://www.thingiverse.com/gaaZolee)'s [Smart compact temperature calibration tower by gaaZolee - Thingiverse](https://www.thingiverse.com/thing:2729076), licensed under the [CC-BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/) license.

The script takes arguments for the starting and ending temperatures and generates a STL model in 5-degree steps from the start to the end (inclusive) along with slicing instructions. Steps ("temperature floors" of the tower) are present for 170 through 265 degrees; if you specify temperatures outside that range then blank/unlabeled floors will be used for them.

## Usage

Because [PyMesh](https://github.com/PyMesh/PyMesh) has a large number of dependencies (including native system library dependencies) it's highly recommended to use the official [pymesh Docker image](https://hub.docker.com/r/pymesh/pymesh).
