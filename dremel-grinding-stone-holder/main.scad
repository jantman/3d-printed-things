$fn=180;

hole_dia = 3.5;
block_width = 56;
block_length = 98;
block_thickness = 14;
hole_depth = 12;
hole_spacing_radius = 7;

module hole() {
    translate([0, 0, (block_thickness - hole_depth) + 0.01]) {
        #cylinder(d=hole_dia, h=hole_depth);
    }
}

module row_of_holes() {
    translate([hole_spacing_radius, 0, 0]) { hole(); }
    translate([hole_spacing_radius * 3, 0, 0]) { hole(); }
    translate([hole_spacing_radius * 5, 0, 0]) { hole(); }
    translate([hole_spacing_radius * 7, 0, 0]) { hole(); }
}

difference() {
    cube([block_width, block_length, block_thickness]);
    translate([0, hole_spacing_radius, 0]) { row_of_holes(); } // bottom row
    translate([0, hole_spacing_radius * 3, 0]) { row_of_holes(); }
    translate([0, hole_spacing_radius * 5, 0]) { row_of_holes(); }
    translate([0, hole_spacing_radius * 7, 0]) { row_of_holes(); }
    translate([0, hole_spacing_radius * 9, 0]) { row_of_holes(); }
    translate([0, hole_spacing_radius * 11, 0]) { row_of_holes(); }
    translate([0, hole_spacing_radius * 13, 0]) { row_of_holes(); }
    // that's 7 rows of 4, 28 total, half of what we need
}
