$fn = 36;
// from: https://www.thingiverse.com/thing:2583402
use <Parametric_Pegboard_Base.scad>;

include <../BOSL/constants.scad>
use <../BOSL/shapes.scad>

module shelf_with_holes(width, depth, thickness) {
  back_spacing = 10;
  difference() {
    cube([width, depth, thickness]);
    // 4.5x10 hole for tweezers
    translate([10,depth - (back_spacing + 5),thickness / 2]) {
      rounded_prismoid(size1=[4.5,10], size2=[8.5,14], h=2.01, r=2);
      translate([0,0,-2]) {
        rounded_prismoid(size1=[4.5,10], size2=[4.5,10], h=2.01, r=2);
      }
    }
    // 4.5x15 hole for forceps
    translate([24,depth - (back_spacing + 7.5),thickness / 2]) {
      rounded_prismoid(size1=[4.5,15], size2=[8.5,19], h=2.01, r=2);
      translate([0,0,-2]) {
        rounded_prismoid(size1=[4.5,15], size2=[4.5,15], h=2.01, r=2);
      }
    }
    // 4.5x15 hole for forceps
    translate([38,depth - (back_spacing + 7.5),thickness / 2]) {
      rounded_prismoid(size1=[4.5,15], size2=[8.5,19], h=2.01, r=2);
      translate([0,0,-2]) {
        rounded_prismoid(size1=[4.5,15], size2=[4.5,15], h=2.01, r=2);
      }
    }
    // 4.5x10 hole for tweezers
    translate([51,depth - (back_spacing + 5),thickness / 2]) {
      rounded_prismoid(size1=[4.5,10], size2=[8.5,14], h=2.01, r=2);
      translate([0,0,-2]) {
        rounded_prismoid(size1=[4.5,10], size2=[4.5,10], h=2.01, r=2);
      }
    }
    // 4.5x10 hole for tweezers
    translate([65,depth - (back_spacing + 5),thickness / 2]) {
      rounded_prismoid(size1=[4.5,10], size2=[8.5,14], h=2.01, r=2);
      translate([0,0,-2]) {
        rounded_prismoid(size1=[4.5,10], size2=[4.5,10], h=2.01, r=2);
      }
    }
  }
}

cols = 3;
base_width = 25.4 * cols;
base_height = 24.4 * 2;
corner_radius = 2;

translate([0,-1.01,0]){
  mirror([0,1,0]) {
    pegboard_base(cols, 2, clearance=0.5, height=2.5, angle=45, depth=4);
  }
}

shelf_width = base_width;

translate([0,-30.9,31]) {
  shelf_with_holes(width=shelf_width, depth=30, thickness=4);
}
