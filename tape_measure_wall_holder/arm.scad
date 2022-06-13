module arm() {
    include <config.scad>
    // hinge
    color("blue") {
        rotate([-90, 0, 0]) {
            intersection() {
                cylinder(d=arm_thickness, h=plate_width);
                translate([0, 0, hinge_tab_width + hinge_gap]) {
                    cylinder(d=arm_thickness, h=(hinge_tab_width - (hinge_gap * 2)));
                }
            }
            translate([0, -1 * (arm_thickness / 2), hinge_tab_width + hinge_gap]) {
                cube([arm_thickness, arm_thickness, (hinge_tab_width - (hinge_gap * 2))]);
            }
            intersection() {
                cylinder(d=arm_thickness, h=plate_width);
                translate([0, 0, (hinge_tab_width * 3) + hinge_gap]) {
                    cylinder(d=arm_thickness, h=(hinge_tab_width - (hinge_gap * 2)));
                }
            }
            translate([0, -1 * (arm_thickness / 2), (hinge_tab_width * 3) + hinge_gap]) {
                cube([arm_thickness, arm_thickness, (hinge_tab_width - (hinge_gap * 2))]);
            }
        }
        // arm
        translate([arm_thickness / 2, 0, -1 * (arm_thickness / 2)]) {
            cube([arm_length, arm_width, arm_thickness]);
        }
    }
}
