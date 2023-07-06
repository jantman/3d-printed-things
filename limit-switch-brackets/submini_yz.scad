// CONFIGURATION
plate_width = inch(0.8);
plate_thickness = 2;
arm_height = inch(1.75);
base_length = inch(1);
mount_slot_width = 4.5; // M4 medium fit clearance
arm_slot_length = arm_height * 0.75;

switch_model_file = "7658K15.stl";
switch_length = inch(0.79);
switch_width = inch(0.63);
switch_thickness = inch(0.26);
switch_hole_diameter = 2.5;
switch_hole_spacing = 9.5;

show_switch = true;
// END CONFIGURATION

$fn = 360;

if($preview && show_switch) {
    translate([(switch_thickness / 2) + plate_thickness, plate_width / 2, arm_height / 2]) {
        rotate([90, 0, 90]) {
            scale([25.4, 25.4, 25.4]) {
                import(switch_model_file);
            }
        }
    }
}

// base
difference() {
    cube([base_length, plate_width, plate_thickness]);
    // slot closest to arm
    base_slot_offset = ((base_length - mount_slot_width) / 3) + (mount_slot_width / 4);
    translate([base_slot_offset, plate_width / 2, 0]) {
        roundedslot(plate_width - (mount_slot_width * 2), mount_slot_width);
    }
    // slot farthest from arm
    translate([(base_slot_offset * 2) + mount_slot_width, plate_width / 2, 0]) {
        roundedslot(plate_width - (mount_slot_width * 2), mount_slot_width);
    }
}
// arm
difference() {
    cube([plate_thickness, plate_width, arm_height]);
    // front slot
    translate([-5, (plate_width - switch_hole_spacing) / 2, arm_height / 2]) {
        rotate([0, 90, 0]) {
            rotate([0, 0, 90]) {
                roundedslot(arm_slot_length, switch_hole_diameter);
            }
        }
    }
    // rear slot
    translate([-5, ((plate_width - switch_hole_spacing) / 2) + switch_hole_spacing, arm_height / 2]) {
        rotate([0, 90, 0]) {
            rotate([0, 0, 90]) {
                roundedslot(arm_slot_length, switch_hole_diameter);
            }
        }
    }
}
// fillet
translate([plate_thickness - 0.001, 0, plate_thickness - 0.001]) {
    fillet(plate_width, plate_thickness);
}

module roundedslot(length, width) {
    height = 40;
    translate([-1 * (width / 2), -1 * (length / 2) + (width / 2), 0]) {
        cube([width, length - width, height]);
        translate([width / 2, 0, 0]) {
            cylinder(h=height, d=width);
        }
        translate([width / 2, length - width, 0]) {
            cylinder(h=height, d=width);
        }
    }
}

function inch(x) = x * 25.4;

module fillet(length, radius) {
    intersection() {
        difference() {
            cube([radius * 2, length, radius * 2]);
            translate([radius, 0, radius]) {
                rotate([-90, 0, 0]) {
                    cylinder(r=radius, h=length);
                }
            }
        }
        translate([0, 0, 0]) {
            cube([radius, length, radius]);
        }
    }
}
