$fn = 360;

hole_depth = inch(1.5);
edge_inset = inch(0.1);
label_width = inch(0.25);
hole_spacing = inch(0.2);
floor_thickness = inch(1/8);
block_height = hole_depth + floor_thickness;

function inch(n) = 25.4 * n;

// front row
front_y = edge_inset + label_width + inch(0.45);
back_y = front_y + inch(0.45 / 2) + hole_spacing + label_width + inch(0.58 + 0.1);
length = edge_inset + (inch(0.71 / 2) * 7) + (hole_spacing * 4) + inch(0.45 / 2);

difference() {
    cube([length, back_y + inch(0.71 / 2) + edge_inset, block_height]);
    // front row
    translate([0, front_y, floor_thickness + 0.01]) {
        translate([edge_inset + inch(0.5 / 2), 0, 0]) { hole(inch(0.4)); }
        translate([edge_inset + (inch(0.5 / 2) * 3) + hole_spacing, 0, 0]) { hole(inch(0.4)); }
        translate([edge_inset + (inch(0.5 / 2) * 5) + (hole_spacing * 2), 0, 0]) { hole(inch(0.4)); }
        translate([edge_inset + (inch(0.5 / 2) * 7) + (hole_spacing * 3), 0, 0]) { hole(inch(0.35)); }
        translate([edge_inset + (inch(0.5 / 2) * 9) + (hole_spacing * 4), 0, 0]) { hole(inch(0.35)); }
    }
    // back row
    translate([0, back_y, floor_thickness + 0.01]) {
        translate([edge_inset + inch(0.71 / 2), 0, 0]) { hole(inch(0.61)); }
        translate([edge_inset + (inch(0.71 / 2) * 3) + hole_spacing, 0, 0]) { hole(inch(0.595)); }
        translate([edge_inset + (inch(0.71 / 2) * 5) + (hole_spacing * 2), 0, 0]) { hole(inch(0.48)); }
        translate([edge_inset + (inch(0.71 / 2) * 7) + (hole_spacing * 3), 0, 0]) { hole(inch(0.47)); }
    }
}

module hole(d) {
    fillet_radius = inch(0.05);
    union() {
        cylinder(d=d, h=hole_depth);
        translate([0, 0, hole_depth - fillet_radius]) {
            cylinder(d1=d, d2=(d + (fillet_radius * 2)), h=fillet_radius);
        }
    }
}
