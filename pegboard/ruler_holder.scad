// THIS FILE: https://github.com/jantman/3d-printed-things/blob/master/pegboard/ruler_holder.scad

// from: https://danielupshaw.com/openscad-rounded-corners/
use <roundedcube.scad>;

// from: https://www.thingiverse.com/thing:2583402
use <Parametric_Pegboard_Base.scad>;

cols = 2;
base_width = 25.4 * cols;
corner_radius = 2;

module front_rounded_cube(dims) {
  //cube(dims);
  roundedcube(dims, false, 2, "all");
}

translate([0,-0.1,0]){
  pegboard_base(cols, 2, clearance=0.5, height=2.5, angle=45, depth=4);
}
translate([0,-2,0]) {
  rotate(a=[15,0,0]){
      front_rounded_cube([base_width, 26, 4]);
  }
}
// top is at 4
translate([0,-2,7]) {
  rotate(a=[15,0,0]){
      front_rounded_cube([base_width, 26, 4]);
  }
}
// top is at 11
translate([0,-2,15]) {
  rotate(a=[15,0,0]){
      front_rounded_cube([base_width, 26, 4]);
  }
}
// top is at 19
translate([0,-2,23]) {
  rotate(a=[15,0,0]){
      front_rounded_cube([base_width, 26, 4]);
  }
}
// top is at 27
translate([0,-2,34]) {
  rotate(a=[15,0,0]){
      front_rounded_cube([base_width, 26, 4]);
  }
}
// top is at 36
translate([0,-2,46]) {
  rotate(a=[15,0,0]){
      front_rounded_cube([base_width, 26, 4]);
  }
}
