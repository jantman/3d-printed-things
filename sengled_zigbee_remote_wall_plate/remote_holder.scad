include <config.scad>;
use <roundedcube.scad>;

rmt_height = inch(3.56);
rmt_width = inch(1.430);
rmt_depth = inch(0.462);

module remote_holder(back_thickness = 0) {
    switch_depth = inch(0.4);
    wall_thickness = inch(0.2);
    thickness = rmt_depth + switch_depth + (wall_thickness * 2) + back_thickness;

    translate([0, 0, (thickness / 2) - 0.001]) {
        difference() {
            roundedcube(size = [rmt_width + (wall_thickness * 2), inch(3), thickness], center = true, radius = wall_thickness, apply_to = "zmax");
            // hollow for remote
            translate([0, (-1 * ((rmt_height - inch(3)) / 2)) - wall_thickness, inch(0.1)]) {
                remote();
            }
            // front opening
            translate([0, wall_thickness, rmt_depth + wall_thickness - 0.001]) {
                cube([rmt_width * 0.75, rmt_height, wall_thickness * 2], center=true);
            }
            // switch and screw opening
            backcut_ht = (wall_thickness * 2) + switch_depth;
            translate([0, (-1 * ((rmt_height - inch(3)) / 2)) - wall_thickness, (-1 * (thickness - back_thickness - backcut_ht) / 2) - 0.001]) {
                cube([(rmt_width * 0.5) + inch(0.25), rmt_height, backcut_ht], center=true);
            }
        }
    }
}

module remote() {
    translate([0, 0, rmt_depth / 2]) {
        cube([rmt_width, rmt_height, rmt_depth], center=true);
    }
}
