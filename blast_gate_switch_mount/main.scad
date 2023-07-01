// CONFIGURATION
hole_diameter = inch(0.13);
plate_length = inch(1.25);
plate_width = inch(0.75);
plate_thickness = inch(0.05);

show_switch = false;
// END CONFIGURATION

$fn = 360;

// blast gate specs
step_height = inch(0.1);
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
    translate([switch_hole_inset, switch_hole_inset, -15]) {
        cylinder(h=40, d=hole_diameter);
    }
    // top right hole
    translate([switch_hole_inset + (switch_length - (switch_hole_inset * 2)), switch_hole_inset + switch_thickness, -15]) {
        cylinder(h=40, d=hole_diameter);
    }
}

module plate() {
    translate([0, -1 * (plate_width - switch_width), -1 * plate_thickness]) {
        cube([plate_length, plate_width, plate_thickness]);
    }
}

function inch(x) = x * 25.4;
