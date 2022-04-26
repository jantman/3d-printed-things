wall_thickness = 2;
padding = 0.5;
depth = 10;
hole_diam = 3.5;

hole_inset = wall_thickness + padding + 2 + (hole_diam / 2);

width = 36 + (padding * 2) + (wall_thickness * 2);
height = 36 + (padding * 2) + (wall_thickness * 2);

difference() {
  cube([width, depth + wall_thickness, height]);
  translate([wall_thickness, -0.01, wall_thickness]) {
    cube([36 + (padding * 2), depth, 36 + (padding * 2)]);
  }
  translate([(width - 18) / 2, -0.01, -0.01]) {
    cube([18, depth, 6]);
  }
  // bottom left screw hole
  translate([hole_inset, 19, hole_inset]) {
    rotate([90, 0, 0]) {
      cylinder(d=hole_diam, h=20, $fn=180);
    }
  }
  // bottom right screw hole
  translate([width - hole_inset, 19, hole_inset]) {
    rotate([90, 0, 0]) {
      cylinder(d=hole_diam, h=20, $fn=180);
    }
  }
  // top left screw hole
  translate([hole_inset, 19, height - hole_inset]) {
    rotate([90, 0, 0]) {
      cylinder(d=hole_diam, h=20, $fn=180);
    }
  }
  // top right screw hole
  translate([width - hole_inset, 19, height - hole_inset]) {
    rotate([90, 0, 0]) {
      cylinder(d=hole_diam, h=20, $fn=180);
    }
  }
}

translate([(width / 2) - (5.75 / 2), 5 + (wall_thickness / 2), 6.99 + height]) {
  rotate([0, 90, 0]) {
    difference() {
      union() {
        cylinder(h=5.75, d=10, $fn=180);
        translate([0, -5, 0]) {
          cube([7, 10, 5.75]);
        }
      }
      translate([0, 0, -1]) {
        cylinder(h=9, d=3, $fn=180);
      }
    }
  }
}
