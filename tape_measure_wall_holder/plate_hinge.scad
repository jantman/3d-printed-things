include <config.scad>

module plate_hinge() {
    rotate([-90, 0, 0]) {
        difference() {
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
            translate([arm_thickness / 2, arm_thickness / 2, 0]) {
                cylinder(h=inch(0.018777), d2=0, d1=inch(0.0625));
            }
            translate([arm_thickness / 2, arm_thickness / 2, plate_width - inch(0.018777)]) {
                #cylinder(h=inch(0.018777), d1=0, d2=inch(0.0625));
            }
        }
    }
}
