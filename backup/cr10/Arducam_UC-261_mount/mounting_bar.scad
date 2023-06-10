include <config.scad>
use <channel.scad>

module mounting_bar() {
  union() {
    translate([(width / 2) + (channel_width / 4), 0, 0]) {
      channel(rot=180);
    }
    // rounded end
    translate([(width / 2) - (5.75 / 2), -1 * (channel_depth + channel_rib_depth + 2), 6.99 + height]) {
      rotate([0, 90, 0]) {
        difference() {
          union() {
            cylinder(h=5.75, d=10, $fn=180);
            translate([0, -5, 0]) {
              cube([7, 10, 5.75]);
            }
            translate([6.99, -5, 0]) {
              cube([height + 0.1, 10, 5.75]);
            }
          }
          translate([0, 0, -1]) {
            cylinder(h=9, d=3, $fn=180);
          }
        }
      }
    }
  }
}

mounting_bar();
