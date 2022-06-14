include <config.scad>
$fn = 360;

module tape_post_assy() {
    translate([tape_post_x_start - (tape_post_cyl_to_block + (tape_post_cylinder_dia / 2)), tape_post_width / 2, 0]) {
        cylinder(d=tape_post_cylinder_dia, h=tape_post_cylinder_height);
    }
    translate([tape_post_x_start, 0, 0]) {
        cube([tape_post_length, tape_post_width, tape_post_height]);
    }
}

// base block
cube([inch(2), tape_post_width, inch(0.125)]);
translate([0, 0, inch(0.125)]) {
    tape_post_assy();
}
