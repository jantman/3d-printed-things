// 3D printers are metric, but I'm working in inches here...
function inch(n) = 25.4 * n; // convert inches to mm

/*
 * BEGIN CONFIGURATION
 */

stop_bump_height = inch(0.25);

tape_slot_length = inch(0.09);
tape_slot_width = inch(1.15);
slot_tape_width = inch(1.15);

tape_post_height = inch(0.3);
tape_post_width = inch(0.41);
tape_post_length = inch(0.25);
tape_post_x_start = inch(0.63);
post_tape_width = inch(0.75);
tape_post_to_slot_gap = inch(0.2);
tape_post_inset = (post_tape_width - tape_post_width) / 2;

// plate - the base of the whole thing
plate_thickness = inch(0.25);
plate_length = inch(8);
plate_width = tape_slot_width + (tape_post_width * 2) + (tape_post_to_slot_gap * 2) + (tape_post_inset * 2);
plate_tab_overhang = inch(0.5);
hinge_tab_width = plate_width / 5;
hinge_gap = 0.05;

// arm - the part that folds out 90°
arm_thickness = plate_thickness;
arm_width = plate_width;
arm_length = inch(3.5);

/*
 * END CONFIGURATION
 */

// Calculated values
