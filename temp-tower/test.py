#!/usr/bin/env python
"""
Largely based on:
https://github.com/PyMesh/PyMesh/blob/384ba882b7558ba6e8653ed263c419226c22bddf/scripts/merge.py
"""

import numpy as np
import pymesh
from pymesh import load_mesh, save_mesh
from pymesh import merge_meshes


def lift_mesh(mesh, z):
    return pymesh.form_mesh(mesh.vertices + [[0, 0, z]], mesh.faces)


def main():
    input_meshes = [
        load_mesh('SmartTemperatureTower_Stand.stl'),
        lift_mesh(load_mesh('SmartTemperatureTower_TempFloor_170.stl'), 1.4),
        lift_mesh(load_mesh('SmartTemperatureTower.stl'), 11.4),
    ]
    output_mesh = merge_meshes(input_meshes)
    save_mesh('output2.stl', output_mesh)


if __name__ == "__main__":
    main()
