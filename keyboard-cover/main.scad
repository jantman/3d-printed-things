// from: https://danielupshaw.com/openscad-rounded-corners/
use <roundedcube.scad>;

// all dimensions in mm
overall_width = 364;
keys_width = 346;

overall_depth = 142;
keys_depth = 124;
back_extra_depth = 0;

overall_height = 15;
keys_height = 13; // actually measured 10

wall_thickness = 2;

outer_modifier = wall_thickness * 2;

module keybd(ow, kw, od, kd, bed, oh, kh, wt, is_top = false) {
  corner_radius = wt;
  union() {
    translate([0,1.5,0]){
      if(is_top) {
        roundedcube([ow, od + bed, oh], false, corner_radius, "zmax");
      }
      else {
        cube([ow, od + bed, oh], false);
      }
    }
    translate([(ow - kw) / 2,(od - kd) / 2,0]) {
      if(is_top) {
        roundedcube([kw, kd, kh + oh], false, corner_radius, "zmax");
      } else {
        cube([kw, kd, kh + oh], false);
      }
    }
  }
}

intersection() { // TODO: For printing a small sizing sample
  difference() {
    color("Blue") {
      keybd(overall_width + outer_modifier, keys_width + outer_modifier, overall_depth + outer_modifier, keys_depth + outer_modifier, back_extra_depth, overall_height + wall_thickness, keys_height, wall_thickness, true);
    }
    color("Gold") {
      translate([wall_thickness, wall_thickness, 0]) {
        keybd(overall_width, keys_width, overall_depth, keys_depth, back_extra_depth, overall_height, keys_height, wall_thickness);
      }
    }
  }
   // TODO: For printing a small sizing sample
  translate([-10, -10, 0]){
    cube([40, overall_depth *2, (overall_height + keys_height) * 2], false);
  }
}
