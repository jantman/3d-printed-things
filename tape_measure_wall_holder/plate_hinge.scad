include <config.scad>

module plate_hinge() {
    rotate([-90, 0, 0]) {
        intersection() {
            difference() {
                cylinder(r=arm_thickness, h=plate_width);
                translate([0, 0, hinge_tab_width - hinge_gap]) {
                    cylinder(r=arm_thickness, h=(hinge_tab_width + (hinge_gap * 2)));
                }
                translate([0, 0, (hinge_tab_width * 3) - hinge_gap]) {
                    cylinder(r=arm_thickness, h=(hinge_tab_width + (hinge_gap * 2)));
                }
            }
            cube([arm_thickness, arm_thickness, plate_width]);
        }
    }
}
