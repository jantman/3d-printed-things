$fn = 36;

module rounded_trapezoid(bottom_width, top_width, height, thickness, radius=2) {
  translate([0,thickness,0]) {
    rotate([90,0,0]) {
      hull() {
        // bottom left
        translate([radius, radius,0]) {
          cylinder(h=thickness, r=radius);
        }
        // bottom right
        translate([bottom_width - radius,radius,0]) {
          cylinder(h=thickness, r=radius);
        }
        // top left
        translate([((bottom_width - top_width) / 2) + radius, height - radius,0]) {
          cylinder(h=thickness, r=radius);
        }
        // top right
        translate([top_width + ((bottom_width - top_width) / 2) - radius,height - radius,0]) {
          cylinder(h=thickness, r=radius);
        }
      }
    }
  }
}
