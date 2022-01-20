$fn = 36;
// from: https://www.thingiverse.com/thing:2583402
use <Parametric_Pegboard_Base.scad>;

/*
cols = 2;
base_width = 25.4 * cols;
base_height = 24.4 * 2;
corner_radius = 2;

translate([0,-1.01,0]){
  mirror([0,1,0]) {
    pegboard_base(cols, 2, clearance=0.5, height=2.5, angle=45, depth=4);
  }
}
*/

module arm(length, back_height, front_height, thickness, tip_height=0, tip_width=0) {
  translate([0,thickness,0]) {
    rotate([90,0,0]) {
      linear_extrude(height=thickness) {
        polygon(points=[ [0,0], [0, back_height], [length, back_height], [length, back_height - front_height] ]);
        if(tip_width > 0) {
          tip_r = tip_width / 2;
          polygon(points=[
            [length, back_height],
            [length - tip_width, back_height],
            [length - tip_width, back_height + (tip_height - tip_r)],
            [length, back_height + (tip_height - tip_r)],
          ]);
          translate([length - tip_r,back_height + (tip_height - tip_r),0]) {
            circle(d=tip_width);
          }
        }
      }
    }
  }
}

// need 5.5mm gap between arms
arm(length=62, back_height=20, front_height=8, thickness=4, tip_height=8, tip_width=6);
