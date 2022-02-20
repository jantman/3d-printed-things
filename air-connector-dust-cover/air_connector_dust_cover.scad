$fn = 72;
thickness = 2.0;
thread_diameter = 13.5;
strap_length = 60;
cap_diameter = 10;
cap_depth = 10;
loop_width = 4;

strap_loop_offset = strap_length + thickness + (cap_diameter / 2);

union() {
    difference() {
        cylinder(cap_depth + thickness, d=cap_diameter + (thickness * 2));
        translate([0,0,thickness]) {
            cylinder(cap_depth, d=cap_diameter);
        }
    }

    translate([0,-1 * (cap_diameter / 2),0]) {
        cube([strap_loop_offset, cap_diameter, thickness]);
    }

    translate([strap_loop_offset + (thread_diameter / 2),0,0]) {
        difference() {
            cylinder(thickness, d=thread_diameter + (loop_width * 2));
            cylinder(thickness, d=thread_diameter);
        }
    }
}