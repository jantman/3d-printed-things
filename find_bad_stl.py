#!/usr/bin/env python3
"""
Python3 script to find bad STL files in the current directory.

Source:
https://github.com/jantman/3d-printed-things/blob/master/my-cr10s/utilities/find_bad_stl.py

Requires Python3 - tested against 3.8.5

## Python Package Dependencies

numpy (pip install numpy) tested against 1.16.3
numpy-stl (pip install numpy-stl) tested against 2.11.2

## Usage

See: find_bad_stl.py -h
"""

import sys
import os
import argparse
import logging
from distutils.spawn import find_executable
from tempfile import mkstemp
from glob import glob
import subprocess
import atexit

import numpy
import stl
from stl import mesh

FORMAT = "[%(asctime)s %(levelname)s] %(message)s"
logging.basicConfig(level=logging.WARNING, format=FORMAT)
logger = logging.getLogger()


class BadStlFinder:

    def __init__(self):
        self._admesh_path = find_executable('admesh')
        if self._admesh_path is None:
            logger.warning(
                '"admesh" executable not found on path; not running admesh!'
            )
        self._searchdir = os.getcwd()
        logger.info('Searching: %s', self._searchdir)
        fh, self._scadfile = mkstemp(suffix='.scad')
        os.close(fh)
        logger.info('Temporary SCAD file: %s', self._scadfile)
        fh, self._stlfile = mkstemp(suffix='.stl')
        os.close(fh)
        logger.info('Temporary STL output file: %s', self._stlfile)

    def cleanup(self):
        logger.info('Removing: %s', self._scadfile)
        os.unlink(self._scadfile)
        logger.info('Removing: %s', self._stlfile)
        os.unlink(self._stlfile)

    def run(self, files=[]):
        if files:
            files = [os.path.abspath(x) for x in files]
        else:
            files = list(glob(
                os.path.join(self._searchdir, '**', '*.stl'), recursive=True
            ))
        logger.info('Found %d STL files to check', len(files))
        logger.debug('STL files: %s', files)
        failed = []
        for f in files:
            if not self.do_stl(f):
                failed.append(f)
        if not failed:
            print('All STL files valid.')
            return
        print('STL files had failures:\n%s' % '\n'.join(failed))
        raise SystemExit(1)

    def do_stl(self, fpath):
        if self._admesh_path is not None:
            if self._is_binary(fpath):
                write_arg = f'--write-binary-stl={fpath}'
            else:
                write_arg = f'--write-ascii-stl={fpath}'
            cmd = [self._admesh_path, write_arg, fpath]
            logger.info('Executing: %s', ' '.join(cmd))
            p = subprocess.run(
                cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                check=False
            )
            logger.debug(
                'admesh exited %d with output:\n%s', p.returncode,
                p.stdout.decode()
            )
            if p.returncode != 0:
                logger.error(
                    '%s exited %d:\n%s', ' '.join(cmd), p.returncode,
                    str(p.stdout.decode())
                )
                return False
            logger.debug('Command returned 0:\n%s', p.stdout.decode())
        logger.debug('Loading STL mesh from %s', fpath)
        obj = mesh.Mesh.from_file(fpath)
        minx, maxx, miny, maxy, minz, maxz = self.stl_bounds(obj)
        scad = self.generate_scad(fpath, minx, maxx, miny, maxy, minz, maxz)
        logger.info('Writing temporary SCAD file for %s', fpath)
        logger.debug(scad)
        with open(self._scadfile, 'w') as fh:
            fh.write(scad)
        cmd = [
            'openscad', '--hardwarnings', '-o', self._stlfile, self._scadfile
        ]
        logger.info('Execute: %s', ' '.join(cmd))
        p = subprocess.run(
            cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
            check=False
        )
        if p.returncode != 0:
            logger.error(
                '%s exited %d:\n%s', ' '.join(cmd), p.returncode,
                str(p.stdout.decode())
            )
            return False
        logger.debug('Command returned 0:\n%s', p.stdout.decode())
        return True

    def generate_scad(self, fpath, minx, maxx, miny, maxy, minz, maxz):
        deltax = maxx - minx
        deltay = maxy - miny
        deltaz = maxz-minz
        s = f"""translate([{maxx + 10},{maxy + 10},{maxz + 10}]){{
            rotate([-90,0,-90]){{
                color([0.2862745225429535, 0.6627451181411743, 0.2862745225429535, 0.5]) {{
                    import("{fpath}");
                }}
            }}
        }}
        union() {{
            color([0.2862745225429535, 0.6627451181411743, 0.2862745225429535, 0.5]) {{
                import("{fpath}");
            }}
            translate([{minx+(deltax/2.0)},{miny+(deltay/2.0)},{minz+(deltaz/2.0)}]){{
                cube([{deltax}, {deltay}, {deltaz}],false);
            }}
        }}
        translate([{minx - 10}, {miny - 10}, {minz - 10}]){{
            difference() {{
                import("{fpath}");
                translate([{minx+(deltax/2.0)},{miny+(deltay/2.0)},{minz+(deltaz/2.0)}]){{
                    cube([{deltax}, {deltay}, {deltaz}],false);
                }}
            }}
        }}
        translate([0, 0, {minz * -1.0}]){{
            intersection() {{
                import("{fpath}");
                translate([{minx+(deltax/2.0)},{miny+(deltay/2.0)},{minz+(deltaz/2.0)}]){{
                    cube([{deltax}, {deltay}, {deltaz}],false);
                }}
            }}
        }}
        """
        return s

    def stl_bounds(self, obj):
        """from: https://www.reddit.com/r/3Dprinting/comments/7ehlfc/python_script_to_find_stl_dimensions/?utm_source=share&utm_medium=web2x&context=3"""
        logger.debug('Finding bounding box for mesh')
        minx = maxx = miny = maxy = minz = maxz = None
        for p in obj.points:
            # p contains (x, y, z)
            if minx is None:
                minx = p[stl.Dimension.X]
                maxx = p[stl.Dimension.X]
                miny = p[stl.Dimension.Y]
                maxy = p[stl.Dimension.Y]
                minz = p[stl.Dimension.Z]
                maxz = p[stl.Dimension.Z]
            else:
                maxx = max(p[stl.Dimension.X], maxx)
                minx = min(p[stl.Dimension.X], minx)
                maxy = max(p[stl.Dimension.Y], maxy)
                miny = min(p[stl.Dimension.Y], miny)
                maxz = max(p[stl.Dimension.Z], maxz)
                minz = min(p[stl.Dimension.Z], minz)
        logger.debug(
            'Bounding box: X=(%s,%s) Y=(%s,%s) Z=(%s,%s)',
            minx, maxx, miny, maxy, minz, maxz
        )
        return minx, maxx, miny, maxy, minz, maxz

    def _is_binary(self, fpath):
        textchars = bytearray(
            {7,8,9,10,12,13,27} | set(range(0x20, 0x100)) - {0x7f}
        )
        bytes = open(fpath, 'rb').read(1024)
        return bool(bytes.translate(None, textchars))


def parse_args(argv):
    p = argparse.ArgumentParser(description='Find bad STL files')
    p.add_argument('-v', '--verbose', dest='verbose', action='count', default=0,
                   help='verbose output. specify twice for debug-level output.')
    p.add_argument('-f', '--files', dest='files', default=[], action='append',
                   help='Specific STL files to check')
    p.add_argument('-k', '--keep', dest='keep', default=False,
                   action='store_true', help='Keep temporary files')
    args = p.parse_args(argv)
    return args


def set_log_info():
    """set logger level to INFO"""
    set_log_level_format(logging.INFO,
                         '%(asctime)s %(levelname)s:%(name)s:%(message)s')


def set_log_debug():
    """set logger level to DEBUG, and debug-level output format"""
    set_log_level_format(
        logging.DEBUG,
        "%(asctime)s [%(levelname)s %(filename)s:%(lineno)s - "
        "%(name)s.%(funcName)s() ] %(message)s"
    )


def set_log_level_format(level, format):
    """
    Set logger level and format.

    :param level: logging level; see the :py:mod:`logging` constants.
    :type level: int
    :param format: logging formatter format string
    :type format: str
    """
    formatter = logging.Formatter(fmt=format)
    logger.handlers[0].setFormatter(formatter)
    logger.setLevel(level)


if __name__ == "__main__":
    args = parse_args(sys.argv[1:])

    # set logging level
    if args.verbose > 1:
        set_log_debug()
    elif args.verbose == 1:
        set_log_info()

    c = BadStlFinder()
    if not args.keep:
        atexit.register(c.cleanup)
    c.run(args.files)
