include <config.scad>

test_length = inch(2.5);
test_width = inch(2);

tape_y_offset = inch(0.2);

difference() {
    translate([inch(-0.5), 0, 0]) {
        cube([test_length, test_width, plate_thickness]);
    }
    // tape hole
    translate([-1 * tape_slot_length, tape_y_offset, -0.1]) {
        cube([tape_slot_length, tape_slot_width, plate_thickness + 0.4]);
    }
}
// block for long tape
translate([tape_post_x_start, tape_y_offset + tape_slot_width + inch(0.2), 0]) {
    cube([tape_post_length, tape_post_width, plate_thickness + tape_post_height]);
}
