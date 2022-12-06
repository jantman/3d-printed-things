include <config.scad>;
// from: https://danielupshaw.com/openscad-rounded-corners/
use <roundedcube.scad>;

module plate(height_inches, width_inches) {
    include <config.scad>;
    depth = inch(0.25);

    difference() {
        translate([-1 * (width_inches / 2), -1 * (height_inches / 2), -1 * depth]) {
            difference() {
                plate_outline(height_inches, width_inches, depth);
                translate([plate_thickness / 2, plate_thickness / 2, -1 * plate_thickness]) {
                    plate_outline(height_inches - (plate_thickness * 2), width_inches - (plate_thickness * 2), depth);
                }
            }
        }
        plate_openings(depth, plate_thickness);
    }
}

module plate_openings(depth, thickness) {
    include <config.scad>;
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

module screw_hole(depth, thickness) {
    hole_size = inch(0.18);
    translate([0, 0, (-1 * depth) + 0.001]) {
        cylinder(d=hole_size, h=depth * 2, $fn=360);
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