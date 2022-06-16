use <plate_hinge.scad>

module triangular_prism(width, depth, height) {
    linear_extrude(height=height) {
        polygon([[-1 * (width / 2), 0], [(width / 2), 0], [0, depth], [-1 * (width / 2), 0]]);
    }
}

module plate() {
    include <config.scad>
    difference() {
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
            translate([inch(3.5) + tape_post_x_start - (tape_post_cyl_to_block + (tape_post_cylinder_dia / 2)), tape_post_inset + (tape_post_width / 2), 0]) {
                cylinder(d=tape_post_cylinder_dia, h=tape_post_cylinder_height + plate_thickness);
            }
            // block for long tape @ 4.5"
            translate([inch(4.5) + tape_post_x_start, plate_width - (tape_post_inset + tape_post_width), 0]) {
                cube([tape_post_length, tape_post_width, plate_thickness + tape_post_height]);
            }
            translate([inch(4.5) + tape_post_x_start - (tape_post_cyl_to_block + (tape_post_cylinder_dia / 2)), plate_width - (tape_post_inset + (tape_post_width / 2)), 0]) {
                cylinder(d=tape_post_cylinder_dia, h=tape_post_cylinder_height + plate_thickness);
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
        // left 3.5" notch
        translate([inch(3.5), 0, 0]) {
            triangular_prism(inch(0.4), inch(0.4), plate_thickness + tape_post_cylinder_height);
        }
        // left 4.5" notch
        translate([inch(4.5), 0, 0]) {
            triangular_prism(inch(0.4), inch(0.4), plate_thickness + tape_post_cylinder_height);
        }
        // right 3.5" notch
        translate([inch(3.5), plate_width, 0]) {
            rotate([0, 0, 180]) {
                triangular_prism(inch(0.4), inch(0.4), plate_thickness + tape_post_cylinder_height);
            }
        }
        // right 4.5" notch
        translate([inch(4.5), plate_width, 0]) {
            rotate([0, 0, 180]) {
                triangular_prism(inch(0.4), inch(0.4), plate_thickness + tape_post_cylinder_height);
            }
        }
    }
}
