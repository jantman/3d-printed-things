$fn = 36;
// from: https://www.thingiverse.com/thing:2583402
use <Parametric_Pegboard_Base.scad>;

include <../BOSL/constants.scad>
use <../BOSL/shapes.scad>

module arm(length, back_height, front_height, thickness, tip_height=0, tip_width=0) {
  btm_radius = (back_height - front_height) / 3;
  translate([0,thickness,0]) {
    rotate([90,0,0]) {
      linear_extrude(height=thickness) {
        polygon(points=[
          [0,0],
          [0, back_height],
          [length, back_height],
          [length, (back_height - front_height) + btm_radius],
          [length - btm_radius, back_height - front_height]
        ]);
        // rounded front bottom corners
        translate([length - btm_radius,(back_height - front_height) + btm_radius,0]) {
          circle(r=btm_radius);
        }
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

module shelf_with_holes(width, depth, thickness) {
  back_spacing = 10;
  difference() {
    cube([width, depth, thickness]);
    // 4.5x10 hole for tweezers
    translate([8,depth - (back_spacing + 5),thickness / 2]) {
      rounded_prismoid(size1=[4.5,10], size2=[8.5,14], h=2.01, r=2);
      translate([0,0,-2]) {
        rounded_prismoid(size1=[4.5,10], size2=[4.5,10], h=2.01, r=2);
      }
    }
    // 4.5x15 hole for forceps
    translate([20,depth - (back_spacing + 7.5),thickness / 2]) {
      rounded_prismoid(size1=[4.5,15], size2=[8.5,19], h=2.01, r=2);
      translate([0,0,-2]) {
        rounded_prismoid(size1=[4.5,15], size2=[4.5,15], h=2.01, r=2);
      }
    }
    // 4.5x15 hole for forceps
    translate([33,depth - (back_spacing + 7.5),thickness / 2]) {
      rounded_prismoid(size1=[4.5,15], size2=[8.5,19], h=2.01, r=2);
      translate([0,0,-2]) {
        rounded_prismoid(size1=[4.5,15], size2=[4.5,15], h=2.01, r=2);
      }
    }
    // 4.5x10 hole for tweezers
    translate([45,depth - (back_spacing + 5),thickness / 2]) {
      rounded_prismoid(size1=[4.5,10], size2=[8.5,14], h=2.01, r=2);
      translate([0,0,-2]) {
        rounded_prismoid(size1=[4.5,10], size2=[4.5,10], h=2.01, r=2);
      }
    }
    // 4.5x10 hole for tweezers
    translate([58,depth - (back_spacing + 5),thickness / 2]) {
      rounded_prismoid(size1=[4.5,10], size2=[8.5,14], h=2.01, r=2);
      translate([0,0,-2]) {
        rounded_prismoid(size1=[4.5,10], size2=[4.5,10], h=2.01, r=2);
      }
    }
  }
}

cols = 4;
base_width = 25.4 * cols;
base_height = 24.4 * 2;
corner_radius = 2;

translate([0,-1.01,0]){
  mirror([0,1,0]) {
    pegboard_base(cols, 2, clearance=0.5, height=2.5, angle=45, depth=4);
  }
}

// LEFT ARMS
translate([4,0,15]) {
  // need 5.5mm gap between arms
  // arm should be at least 60mm long. The tip is not included.
  rotate([0,0,-90]) {
    arm(length=68, back_height=20, front_height=8, thickness=4, tip_height=8, tip_width=6);
  }
  translate([9.5,0,0]) {
    rotate([0,0,-90]) {
      arm(length=68, back_height=20, front_height=8, thickness=4, tip_height=8, tip_width=6);
    }
  }
}

shelf_width = (base_width - 43) + 8;

// RIGHT ARMS
translate([shelf_width + 9 + 7.8,0,15]) {
  // need 5.5mm gap between arms
  // arm should be at least 60mm long. The tip is not included.
  rotate([0,0,-90]) {
    arm(length=68, back_height=20, front_height=8, thickness=4, tip_height=8, tip_width=6);
  }
  translate([10,0,0]) {
    rotate([0,0,-90]) {
      arm(length=68, back_height=20, front_height=8, thickness=4, tip_height=8, tip_width=6);
    }
  }
}

translate([17,-30.9,31]) {
  shelf_with_holes(width=shelf_width, depth=30, thickness=4);
}
