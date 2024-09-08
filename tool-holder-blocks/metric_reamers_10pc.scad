$fn = 360;

function inch(n) = 25.4 * n;

hole_depth = inch(1.5);
edge_inset = inch(0.1);
label_width = inch(0.25);
hole_spacing = inch(0.2);
floor_thickness = inch(1/8);
block_height = hole_depth + floor_thickness;

// front row
front_y = edge_inset + label_width + (8/2);
back_y = front_y + (13/2) + hole_spacing + label_width + (13/2);
length = ((13 + hole_spacing) * 5) + (edge_inset * 2);

difference() {
    cube([length, back_y + (13/2) + edge_inset, block_height]);
    // front row
    translate([0, front_y, floor_thickness + 0.01]) {
        translate([(length / 6), 0, 0]) { hole(4); }
        translate([(length / 6) * 2, 0, 0]) { hole(5); }
        translate([(length / 6) * 3, 0, 0]) { hole(6); }
        translate([(length / 6) * 4, 0, 0]) { hole(7); }
        translate([(length / 6) * 5, 0, 0]) { hole(8); }
    }
    // back row
    translate([0, back_y, floor_thickness + 0.01]) {
        translate([(length / 6), 0, 0]) { hole(9); }
        translate([(length / 6) * 2, 0, 0]) { hole(10); }
        translate([(length / 6) * 3, 0, 0]) { hole(11); }
        translate([(length / 6) * 4, 0, 0]) { hole(12); }
        translate([(length / 6) * 5, 0, 0]) { hole(13); }
    }
}

module hole(d) {
    fillet_radius = 0.5;
    union() {
        cylinder(d=d, h=hole_depth);
        translate([0, 0, hole_depth - fillet_radius]) {
            cylinder(d1=d, d2=(d + (fillet_radius * 2)), h=fillet_radius);
        }
    }
}
