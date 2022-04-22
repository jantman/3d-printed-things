use <collet.scad>;

$fn = 180;

// dimensions of the collet that we form the holder around
collet_tolerance_mm = 0.5; // add to each collet dimension for clearance in the holder; IN MM
collet_base_diam = inch(0.9495) + collet_tolerance_mm*2;
collet_max_diam  = inch(1.25) + collet_tolerance_mm*2;
collet_total_len = inch(3.98) + collet_tolerance_mm*2;

// overall length of the holder - this works out to a total of 4.75 inches
overall_length = collet_total_len + inch(0.77);
// thickness of the front piece against the bottom of the collet. 0.52 inches is nice for a 1/2" / 12mm label
front_length = inch(0.52);
bottom_thickness = 3;
side_thickness = 3;
overall_width = collet_max_diam + (side_thickness * 2);

// diameter of the finger cutout on the sides
cutout_diameter = 30;

difference() {
  // base cube for the holder
  translate([-1 * (overall_width / 2), 0, 0]) {
    cube([overall_width, overall_length, (collet_max_diam / 2) + bottom_thickness]);
  }
  // collet to subtract from cube
  translate([0, front_length, bottom_thickness + (collet_max_diam / 2)]) {
    rotate([-90, 0, 0]) {
      endmill_collet(collet_base_diam, collet_max_diam, collet_total_len, collet_tolerance_mm);
    }
  }
  // opening under collet to save filament
  translate([-1 * (collet_base_diam / 4), front_length, -1]) {
    cube([collet_base_diam / 2, collet_total_len * 0.85, 40]);
  }
  // side cut-outs to make it easier to pick up collet
  translate([(overall_width+2) / 2, overall_length / 2, (cutout_diameter / 2) + bottom_thickness]) {
    rotate([-90, 0, 90]) {
      cylinder(d=cutout_diameter, h=overall_width+2);
    }
  }
}
