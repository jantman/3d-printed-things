use <rounded_trapezoid.scad>;

// from: https://www.thingiverse.com/thing:2583402
use <Parametric_Pegboard_Base.scad>;

cols = 2;
base_width = 25.4 * cols;
base_height = 24.4 * 2;
corner_radius = 2;

translate([0,-1.01,0]){
  mirror([0,1,0]) {
    pegboard_base(cols, 2, clearance=0.5, height=2.5, angle=45, depth=4);
  }
}

xbottom = 47;
xtop = 8;
lip = 2;
depth = 15;
height = 32;

translate([(base_width - xbottom) / 2,-1 * depth,(base_height - height) / 2]) {
  rounded_trapezoid(bottom_width=xbottom, top_width=xtop, height=height, thickness=depth);
}
translate([(base_width - (xbottom + (lip * 2))) / 2,(-1 * depth) - (lip - 0.1),(base_height - (height + (lip * 2))) / 2]) {
  rounded_trapezoid(bottom_width=(xbottom + (lip * 2)), top_width=xtop + (lip * 2), height=(height + (lip * 2)), thickness=2);
}
