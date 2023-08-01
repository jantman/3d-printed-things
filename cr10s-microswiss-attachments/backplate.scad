$fn = 360;

show_carriage = true;

if(show_carriage && $preview) {
    translate([-128.125, 0, -25.18]) {
        rotate([90, 0, -90]) {
            import("../my-cr10s/models/madbuda_Micro_Swiss_Direct_Drive_thing_4170190/files/micro_swiss_DD_v2.stl");
        }
    }
}

backplate();

module backplate() {
    include <config.scad>
    difference() {
        translate([-1 * (boss_cutout_length / 2) - backplate_padding, -1 * backplate_thickness, -23]) {
            cube([backplate_width, backplate_thickness, backplate_height]);
        }
        translate([-1 * (screw_hole_center_to_center / 2), 20, 0]) {
            rotate([90, 0, 0]) {
                cylinder(d=screw_clearance_diameter, h=40);
            }
        }
        translate([screw_hole_center_to_center / 2, 20, 0]) {
            rotate([90, 0, 0]) {
                cylinder(d=screw_clearance_diameter, h=40);
            }
        }
        translate([0, -1 * boss_cutout_depth / 2, 0]) {
            cube([boss_cutout_length, boss_cutout_depth, boss_cutout_height], center=true);
        }
    }
}