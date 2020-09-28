#!/usr/bin/python
#
# From:
# https://github.com/jantman/3d-printed-things/blob/master/step-to-objects-stl.py
#
# This script is based on:
# https://gist.github.com/sleemanj/8ac1270e7e4fb5f6363707b3e1394529
#
# USAGE: ./step-to-objects-stl.py FILENAME.step
#
# NOTE: You may need to update the appended paths if your FreeCAD doesn't
# install under /usr/lib/freecad.

import sys
import os
import string
import argparse
from typing import List

sys.path.append("/usr/lib/freecad/lib")
sys.path.append("/usr/lib/freecad/Mod")
sys.path.append("/usr/lib/freecad/Ext")

import FreeCADGui
FreeCADGui.showMainWindow()  # needs to be before ImportGui
import ImportGui
import Mesh


def safe_filename(s: str) -> str:
    """Generate a filesystem-safe filename"""
    def safe_char(c: str):
        if c in string.ascii_letters + string.digits + '.-':
            return c
        else:
            return "_"
    return "".join(safe_char(c) for c in s).rstrip("_")


class ExportedObject:

    def __init__(self, obj, name, out_dir, parent_path=[], color_rgba=None):
        self.obj = obj
        self.name = name
        self.parent_path = parent_path
        self.color_rgba = color_rgba
        self.out_dir = out_dir
        dir_path = [self.out_dir] + self.parent_path
        self.directory = os.path.join(*dir_path)
        self.fpath = os.path.join(self.directory, self.name + '.stl')

    def export(self):
        if not os.path.exists(self.directory):
            print(f'Creating directory: {self.directory}')
            os.makedirs(self.directory)
        print(f'Exporting {self.obj.Label} to {self.fpath}')
        Mesh.export([self.obj], self.fpath)
        print('\tfile written')

    @property
    def scad(self):
        s = '// ' + ' / '.join(self.parent_path + [self.name]) + '\n'
        if self.color_rgba is not None:
            s += f' color({self.color_rgba}) {{ '
        s += f' import("{os.path.relpath(self.fpath, self.out_dir)}"); '
        if self.color_rgba is not None:
            s += ' } '
        return s


class StepToStlConverter:

    def __init__(self, step_file, out_dir):
        self._step_file = step_file
        self._out_dir = out_dir
        self._objects = []

    def convert(self):
        doc = FreeCAD.newDocument("Unnamed")
        FreeCAD.setActiveDocument("Unnamed")
        ImportGui.insert(self._step_file, "Unnamed")
        for rootobj in doc.RootObjects:
            self._handle_object(rootobj)

        scadfile = os.path.join(
            self._out_dir, os.path.basename(self._step_file) + '.scad'
        )
        print(f'Writing SCAD file with import statements to: {scadfile}')
        with open(scadfile, 'w') as fh:
            for f in self._objects:
                fh.write(f.scad + '\n')
        print('\tfile written')
        FreeCAD.closeDocument("Unnamed")

    def _handle_object(self, o, parent_path=[]):
        print(f'handle_object {o}')
        name = safe_filename(o.Label)
        if isinstance(o, Part.Feature):
            try:
                color_rgba = list(o.ViewObject.DiffuseColor[0])
                assert all([isinstance(x, type(0.5)) for x in color_rgba])
                # for some reason, it looks like alpha is inverted in
                # freecad vs openscad
                color_rgba[3] = 1.0 - color_rgba[3]
            except Exception:
                color_rgba = None
            self._objects.append(
                ExportedObject(
                    o, name, self._out_dir,
                    parent_path=parent_path, color_rgba=color_rgba
                )
            )
            self._objects[-1].export()
        else:
            print(f'Not exporting {o.__class__} {o.Label}')
        if hasattr(o, 'OutList'):
            for child in o.OutList:
                self._handle_object(child, parent_path + [name])


def main(argv: List[str]):
    p = argparse.ArgumentParser(
        description='Convert STEP file to STL files per object and SCAD file'
    )
    p.add_argument(
        '-o', '--out-dir', dest='out_dir', type=str, default=None,
        action='store',
        help='Output directory. Defaults to same directory as input file'
    )
    p.add_argument(
        'STEP_FILE', type=str, action='store', help='STEP file path'
    )
    args = p.parse_args(argv)
    if args.out_dir is None:
        args.out_dir = os.path.dirname(args.STEP_FILE)
    StepToStlConverter(args.STEP_FILE, args.out_dir).convert()


if __name__ == "__main__":
    main(sys.argv[1:])
