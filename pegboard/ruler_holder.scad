// THIS FILE: https://github.com/jantman/3d-printed-things/blob/master/pegboard/ruler_holder.scad

// from: https://danielupshaw.com/openscad-rounded-corners/
use <roundedcube.scad>;

// from: https://www.thingiverse.com/thing:2583402
use <Parametric_Pegboard_Base.scad>;

cols = 2;
base_width = 25.4 * cols;
corner_radius = 2;

difference() {
  union() {
    translate([0,-0.1,0]){
      pegboard_base(cols, 2, clearance=0.5, height=2.5, angle=45, depth=2);
    }
    translate([0,-2,0]) {
      roundedcube([base_width, 26, 25.4 * 2], false, corner_radius, "all");
    }
  }
  translate([-25,2,5]) {
    rotate(a=[20,0,0]){
      color("blue") {
        cube([2 * base_width, 50, 3]);
      }
    }
  }
}
