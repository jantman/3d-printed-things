include <config.scad>;
// from: https://danielupshaw.com/openscad-rounded-corners/
use <roundedcube.scad>;

module plate(height_inches, width_inches) {
    screw_spacing_vertical = inch(2.375);
    opening_height = inch(0.96);
    opening_width = inch(0.42);
    thickness = inch(0.1);
    depth = inch(0.25);

    difference() {
        translate([-1 * (width_inches / 2), -1 * (height_inches / 2), -1 * depth]) {
            difference() {
                plate_outline(height_inches, width_inches, depth);
                translate([thickness / 2, thickness / 2, -1 * thickness]) {
                    plate_outline(height_inches - (thickness * 2), width_inches - (thickness * 2), depth);
                }
            }
        }
        // toggle switch opening
        translate([0, 0, -1 * depth]) {
            cube([opening_width, opening_height, depth * 3], center=true);
        }
        translate([0, screw_spacing_vertical / 2, 0]) {
            screw_hole(depth, thickness);
        }
        translate([0, -1 * (screw_spacing_vertical / 2), 0]) {
            screw_hole(depth, thickness);
        }
    }
}

module screw_hole(depth, thickness) {
    hole_size = inch(0.18);
    countersink_size = inch(0.35);
    translate([0, 0, (-1 * depth) + 0.001]) {
        cylinder(d=hole_size, h=depth, $fn=360);
    }
    translate([0, 0, (-1 * (thickness / 2)) + 0.001]) {
        cylinder(d1=hole_size, d2=countersink_size, h=thickness, $fn=360);
    }
}

module plate_outline(height_in, width_in, thickness_in) {
    intersection() {
        translate([0, 0, 0]) {
            cube([width_in, height_in, thickness_in]);
        }
        translate([0, 0, -1 * thickness_in]) {
            roundedcube(size = [width_in, height_in, thickness_in], center = false, radius = thickness_in, apply_to = "zmin");
        }
    }
}