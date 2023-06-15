led_width = 10.14;
led_length = 51.15;
led_hole_dia = 2.4; // M2 screw normal fit H13
led_countersink_dia = 4.4; // M2 countersink
led_thickness = 1.65;
led_hole_inset_long_axis = 11.8 + (led_hole_dia / 2);
led_hole_inset_short_axis = 1 + (led_hole_dia / 2);
solder_pad_length = 6;

mounting_hole_dia = 4.5; // M4 normal fit H13
mounting_hole_inset = 6;
plate_width = 20;
plate_length = 80;
plate_thickness = 2.5;
$fn = 360;

show_bar = false;

if(show_bar) {
    bar();
}
color("red") {
    plate();
}

module bar() {
    difference() {
        union() {
            color("green") {
                cube([led_length, led_width, led_thickness]);
            }
            color("gold") {
                translate([0, 0, -0.1]) {
                    cube([solder_pad_length, led_width, led_thickness + 0.2]);
                }
            }
        }
        // screw holes
        translate([led_hole_inset_long_axis, led_width - led_hole_inset_short_axis, -1 * led_thickness]) {
            cylinder(d=led_hole_dia, h=led_thickness * 2);
        }
        translate([led_length - led_hole_inset_long_axis, led_width - led_hole_inset_short_axis, -1 * led_thickness]) {
            cylinder(d=led_hole_dia, h=led_thickness * 2);
        }
    }
}

module plate() {
    difference() {
        translate([-1 * (plate_length - led_length) / 2, -1 * (plate_width - led_width) / 2, -1 * plate_thickness]) {
            cube([plate_length, plate_width, plate_thickness]);
        }
        // LED screw holes
        translate([led_hole_inset_long_axis, led_width - led_hole_inset_short_axis, -10]) {
            cylinder(d=led_hole_dia, h=20);
        }
        // countersink
        translate([led_hole_inset_long_axis, led_width - led_hole_inset_short_axis, -1 * (plate_thickness)]) {
            cylinder(h=1, d2=led_hole_dia, d1=led_countersink_dia);
        }
        translate([led_length - led_hole_inset_long_axis, led_width - led_hole_inset_short_axis, -10]) {
            cylinder(d=led_hole_dia, h=20);
        }
                // countersink
        translate([led_length - led_hole_inset_long_axis, led_width - led_hole_inset_short_axis, -1 * (plate_thickness)]) {
            cylinder(h=1, d2=led_hole_dia, d1=led_countersink_dia);
        }
        // cutout for solder pads
        translate([-1, 0, -5]) {
            cube([solder_pad_length + 3, led_width, 10]);
        }
        // same translation as plate cube, for items relative to that
        translate([-1 * (plate_length - led_length) / 2, -1 * (plate_width - led_width) / 2, -1 * plate_thickness]) {
            // T-nut screw holes
            translate([mounting_hole_inset, plate_width / 2, -10]) {
                cylinder(d=mounting_hole_dia, h=20);
            }
            translate([plate_length - mounting_hole_inset, plate_width / 2, -10]) {
                cylinder(d=mounting_hole_dia, h=20);
            }
        }
    }
}