include <config.scad>
use <plate.scad>
use <arm.scad>
use <plate_hinge.scad>

$fn = 360;

plate();
translate([-1 * (arm_thickness / 2), 0, -1 * (arm_thickness / 2)]) {
    arm();
}
