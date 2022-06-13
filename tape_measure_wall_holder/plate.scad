use <plate_hinge.scad>

module plate() {
    include <config.scad>

    union() {
        difference() {
            translate([-1 * (plate_tab_overhang + arm_thickness), 0, 0]) {
                cube([plate_length, plate_width, plate_thickness]);
            }
            // tape hole @ 3.5"
            translate([inch(3.5) - tape_slot_length, (plate_width - tape_slot_width) / 2, -0.1]) {
                cube([tape_slot_length, tape_slot_width, plate_thickness + 0.4]);
            }
            // tape hole @ 4.5"
            translate([inch(4.5) - tape_slot_length, (plate_width - tape_slot_width) / 2, -0.1]) {
                cube([tape_slot_length, tape_slot_width, plate_thickness + 0.4]);
            }
        }
        // block for long tape @ 3.5"
        translate([inch(3.5) + tape_post_x_start, tape_post_inset, 0]) {
            cube([tape_post_length, tape_post_width, plate_thickness + tape_post_height]);
        }
        // block for long tape @ 4.5"
        translate([inch(4.5) + tape_post_x_start, plate_width - (tape_post_inset + tape_post_width), 0]) {
            cube([tape_post_length, tape_post_width, plate_thickness + tape_post_height]);
        }
        // plate overhang / tab
        translate([-1 * (plate_tab_overhang + arm_thickness), 0, -1 * (arm_thickness * 2)]) {
            cube([plate_tab_overhang, plate_width, arm_thickness * 2]);
        }
        // plate hinge
        translate([-1 * arm_thickness, 0, 0]) {
            plate_hinge();
        }
    }
}
