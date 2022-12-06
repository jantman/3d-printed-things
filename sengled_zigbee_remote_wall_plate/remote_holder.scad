include <config.scad>;
use <roundedcube.scad>;

rmt_height = inch(3.56);
rmt_width = inch(1.430);
rmt_depth = inch(0.462);

module remote_holder() {
    switch_depth = inch(0.6);
    wall_thickness = inch(0.2);
    thickness = rmt_depth + switch_depth + (wall_thickness * 2);
    translate([0, 0, (thickness / 2) - 0.001]) {
        difference() {
            roundedcube(size = [rmt_width + (wall_thickness * 2), rmt_height + wall_thickness, thickness], center = true, radius = wall_thickness, apply_to = "zmax");
            // hollow for remote
            translate([0, wall_thickness, 0]) {
                remote();
            }
            // front opening
            translate([0, wall_thickness, rmt_depth + wall_thickness - 0.001]) {
                cube([rmt_width * 0.75, rmt_height, wall_thickness * 2], center=true);
            }
            // switch and screw opening
            translate([0, wall_thickness, (-1 * rmt_depth) + (wall_thickness)]) {
                cube([rmt_width * 0.5, rmt_height, (wall_thickness * 2) + switch_depth], center=true);
            }
        }
    }
}

module remote() {
    translate([0, 0, rmt_depth / 2]) {
        cube([rmt_width, rmt_height, rmt_depth], center=true);
    }
}
