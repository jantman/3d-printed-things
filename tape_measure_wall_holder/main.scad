// 3D printers are metric, but I'm working in inches here...
function inch(n) = 25.4 * n; // convert inches to mm

include <config.scad>
use <plate.scad>
use <arm.scad>

arm();
