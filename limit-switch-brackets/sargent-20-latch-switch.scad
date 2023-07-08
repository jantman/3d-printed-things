// all dimensions in mm for 3d printing
block_length = 27.5;
block_height = 20;
block_depth = 25;

cutout_depth = block_depth - 9.39;
cutout_width = 12;
cutout_offset = 10;

show_switch = true;
//////////////////////
// END CONFIGURATION /
//////////////////////

use <../BOSL/metric_screws.scad>;
$fn = 360;

switch_model_file = "7658K15.stl";
switch_length = inch(0.79);
switch_width = inch(0.63);
switch_thickness = inch(0.26);
switch_hole_diameter = 2.5;
switch_hole_spacing = 9.5;
switch_hole_cl_from_bottom = inch(0.09);
switch_hole_cl_from_front = inch(0.21);

spacing = 0.1;

difference() {
    cube([block_length, block_depth, block_height]);
    translate([cutout_offset, -1 * spacing, -1 * spacing]) {
        cube([cutout_width, cutout_depth + spacing, block_height + (spacing * 2)]);
    }
    translate([block_length - 9, switch_hole_cl_from_bottom, block_height - switch_hole_cl_from_front]) {
        rotate([0, 90, 0]) {
            cylinder(d=switch_hole_diameter, h=10);
        }
    }
    translate([block_length - 9, switch_hole_cl_from_bottom, block_height - (switch_hole_cl_from_front + switch_hole_spacing)]) {
        rotate([0, 90, 0]) {
            cylinder(d=switch_hole_diameter, h=10);
        }
    }
    translate([(block_length - (cutout_width + cutout_offset)), -0.01, block_height - 5]) {
        rotate([90, 0, 0]) {
            metric_bolt(size=4.2, headtype="socket", l=block_depth, pitch=0, align="sunken", include_internal_hex=false);
        }
    }
    translate([cutout_width + (cutout_offset / 2), cutout_depth - 0.5, 5]) {
        rotate([90, 0, 0]) {
            metric_bolt(size=4.2, headtype="socket", l=block_depth, pitch=0, align="sunken", include_internal_hex=false);
        }
    }
}

if($preview && show_switch) {
    translate([cutout_width + cutout_offset - (switch_thickness / 2), 0, switch_length / 2]) {
        rotate([0, 180, 0]) {
            rotate([0, 90, 0]) {
                scale([25.4, 25.4, 25.4]) {
                    import(switch_model_file);
                }
            }
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
