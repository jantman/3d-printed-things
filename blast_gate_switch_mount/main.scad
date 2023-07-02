// CONFIGURATION
hole_diameter = inch(0.14);
plate_length = inch(2);
plate_width = inch(2.5);
plate_thickness = inch(0.12);
switch_offset = inch(0);
slot_width = 4.5; // M4 medium fit clearance
slot_length = plate_width - (slot_width * 3);

show_switch = false;
// END CONFIGURATION
use <../BOSL/metric_screws.scad>;

$fn = 360;

// blast gate specs
step_height = inch(0.135);
lip_width = inch(0.4);

// switch specs
switch_length = inch(1.09);
switch_width = inch(0.63);
switch_thickness = inch(0.41);
switch_hole_inset = inch(0.11);

if(show_switch) {
    translate([switch_length / 2, switch_width / 2, switch_thickness / 2]) {
        scale([25.4, 25.4, 25.4]) {
            import("7779K62.stl");
        }
    }
}

difference() {
    plate();
    // bottom left hole
    translate([switch_hole_inset, switch_hole_inset, -1 * plate_thickness]) {
        rotate([180, 0, 0]) {
            metric_bolt(size=3.15, headtype="countersunk", l=20, pitch=0, align="sunken");
        }
    }
    // top right hole
    translate([switch_hole_inset + (switch_length - (switch_hole_inset * 2)), switch_hole_inset + switch_thickness, -1 * plate_thickness]) {
        rotate([180, 0, 0]) {
            metric_bolt(size=3.15, headtype="countersunk", l=20, pitch=0, align="sunken");
        }
    }
}

module plate() {
    difference() {
        union() {
            // main plate
            translate([0, -1 * (plate_width - switch_width + switch_offset), -1 * plate_thickness]) {
                cube([plate_length, plate_width, plate_thickness]);
            }
            // lip on side
            translate([plate_length - lip_width, -1 * (plate_width - switch_width + switch_offset), -1 * (step_height + plate_thickness)]) {
                cube([lip_width, plate_width, step_height + 0.1]);
            }
        }
        // screw slot
        translate([(plate_length - lip_width) + (lip_width / 2), -1 * ((plate_width / 2) - switch_width + switch_offset), -20]) {
            roundedslot(slot_length, slot_width);
        }
    }
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
