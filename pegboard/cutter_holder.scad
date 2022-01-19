// WARNING - BAD PART - see README

// from: https://www.thingiverse.com/thing:2583402
use <Parametric_Pegboard_Base.scad>;

cols = 2;
base_width = 25.4 * cols;
corner_radius = 2;

translate([-1 * ((base_width - 37) / 2),-1.01,0]){
  mirror([0,1,0]) {
    pegboard_base(cols, 2, clearance=0.5, height=2.5, angle=45, depth=4);
  }
}

// original is 37mm wide
// triangle is 27.5mm tall

translate([0,0,(base_width - 27.5) / 2]) {
  difference() {
    // trim the original pegs off
    import("pegboard_cesoie_v4_thingiverse4950608.stl");
    translate([-1,0,-1]) {
      cube([40,40,40]);
    }
  }
}
