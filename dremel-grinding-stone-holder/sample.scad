$fn=180;

hole_dia = 3.5;
hole_spacing_radius = 7;
block_width = 60;
block_length = hole_spacing_radius * 16;
block_thickness = 14;
hole_depth = 12;

module hole() {
    translate([0, 0, (block_thickness - hole_depth) + 0.01]) {
        cylinder(d=hole_dia, h=hole_depth);
    }
}

module row_of_holes() {
    // TODO: Need a formula for the offsets sized to fit 7 across, with varied spacing
    translate([2 + (3.5 / 2), 0, 0]) { hole(); }
    translate([2 + 3.5 + 2 + (4/2), 0, 0]) { hole(); }
    translate([2 + 3.5 + 2 + 4 + 2 + (5/2), 0, 0]) { hole(); }
    translate([2 + 3.5 + 2 + 4 + 2 + 5 + 2 + (6/2), 0, 0]) { hole(); }
    translate([2 + 3.5 + 2 + 4 + 2 + 5 + 2 + 6 + 2 + (8/2), 0, 0]) { hole(); }
    translate([2 + 3.5 + 2 + 4 + 2 + 5 + 2 + 6 + 2 + 8 + 2 + (10/2), 0, 0]) { hole(); }
    translate([2 + 3.5 + 2 + 4 + 2 + 5 + 2 + 6 + 2 + 8 + 2 + 10 + 2 + (12/2), 0, 0]) { hole(); }
}

intersection() {
    difference() {
        cube([block_width, block_length, block_thickness]);
        // 3, 4, 5, 6, 8, 10, 12mm
        translate([0, hole_spacing_radius, 0]) { row_of_holes(); } // bottom row
        translate([0, hole_spacing_radius * 3, 0]) { row_of_holes(); }
        translate([0, hole_spacing_radius * 5, 0]) { row_of_holes(); }
        translate([0, hole_spacing_radius * 7, 0]) { row_of_holes(); }
        translate([0, hole_spacing_radius * 9, 0]) { row_of_holes(); }
        translate([0, hole_spacing_radius * 11, 0]) { row_of_holes(); }
        translate([0, hole_spacing_radius * 13, 0]) { row_of_holes(); }
        translate([0, hole_spacing_radius * 15, 0]) { row_of_holes(); } // top row
    }
    cube([13, 27, block_thickness]);
}
