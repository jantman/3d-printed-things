led_width = 10.14;
led_length = 51.15;
led_hole_dia = 2.4; // M2 screw normal fit H13
led_countersink_dia = 4.4; // M2 countersink
led_thickness = 1.65;
led_hole_inset_long_axis = 11.8 + (led_hole_dia / 2);
led_hole_inset_short_axis = 1 + (led_hole_dia / 2);
solder_pad_length = 6;

plate_width = 40;
plate_length = 80;
plate_thickness = 2.5;

adjustability = 20;

leg_setback = 20;
mounting_hole = 5.5;
leg_length = leg_setback + mounting_hole + 5;

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
        union() {
            // LED mounting plate
            translate([-1 * (plate_length - led_length) / 2, -1 * (plate_width - led_width) / 2, -1 * plate_thickness]) {
                cube([plate_length, plate_width, plate_thickness]);
            }
            // gantry mounting leg
            translate([-1 * (plate_length - led_length) / 2, -1 * (plate_width - led_width) / 2, -1 * plate_thickness]) {
                cube([plate_thickness, plate_width, leg_length]);
            }
            // fillet
            translate([(-1 * (plate_length - led_length) / 2) + plate_thickness - 0.01, -1 * (plate_width - led_width) / 2, -0.01]) {
                fillet(plate_width, plate_thickness);
            }
        }
        // mounting hole
        translate([(-1 * (plate_length - led_length) / 2) - 4, (-1 * (plate_width - led_width) / 2) + (plate_width / 2), leg_setback]) {
            rotate([0, 90, 0]) {
                cylinder(d=mounting_hole, h=20);
            }
        }
        // LED screw holes
        translate([led_hole_inset_long_axis, led_width - led_hole_inset_short_axis, -10]) {
            cube([led_hole_dia, led_hole_dia + adjustability, 20], center=true);
        }
        translate([led_length - led_hole_inset_long_axis, led_width - led_hole_inset_short_axis, -10]) {
            cube([led_hole_dia, led_hole_dia + adjustability, 20], center=true);
        }
        // cutout for solder pads
        translate([-1, -1 * adjustability / 2, -5]) {
            cube([solder_pad_length + 3, led_width + adjustability, 10]);
        }
    }
}

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