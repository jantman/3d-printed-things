module clamp(id, od, gap) {
    include <config.scad>
    translate([0, -1 * (backplate_thickness + (od / 2)), -23]) {
        difference() {
            union() {
                cylinder(d=od, h=backplate_height);
                translate([od / -2, 0, 0]) {
                    cube([od, (od / 2) + 0.1, backplate_height]);
                }
                translate([-1 * od / 4, -1 * (backplate_thickness) - (od / 4), 0]) {
                    cube([od / 2, od * 1.5, backplate_height]);
                }
            }
            translate([0, 0, -1]) {
                cylinder(d=id, h=backplate_height + 2);
            }
            translate([-1 * (screw_hole_center_to_center / 2), (od / 2) + 0.1, 23]) {
                rotate([90, 0, 0]) {
                    cylinder(d=screw_head_diameter, h=40);
                }
            }
            translate([screw_hole_center_to_center / 2, (od / 2) + 0.1, 23]) {
                rotate([90, 0, 0]) {
                    cylinder(d=screw_head_diameter, h=40);
                }
            }
            translate([-1 * (gap / 2), -1 * (backplate_thickness + (od / 3)), -1]) {
                cube([gap, od, backplate_height + 2]);
            }
        }
    }
}
