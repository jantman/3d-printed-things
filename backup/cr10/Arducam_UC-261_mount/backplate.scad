use <channel.scad>

$fn = 180;

module backplate() {
  include <config.scad>
  union() {
    difference() {
      cube([width, wall_thickness, height]);
      // bottom left screw hole
      translate([hole_inset, depth, hole_inset]) {
        rotate([90, 0, 0]) {
          cylinder(d=hole_diam, h=20, $fn=180);
        }
      }
      // bottom right screw hole
      translate([width - hole_inset, depth, hole_inset]) {
        rotate([90, 0, 0]) {
          cylinder(d=hole_diam, h=20, $fn=180);
        }
      }
      // top left screw hole
      translate([hole_inset, depth, height - hole_inset]) {
        rotate([90, 0, 0]) {
          cylinder(d=hole_diam, h=20, $fn=180);
        }
      }
      // top right screw hole
      translate([width - hole_inset, depth, height - hole_inset]) {
        rotate([90, 0, 0]) {
          cylinder(d=hole_diam, h=20, $fn=180);
        }
      }
    }
    difference() {
      translate([(width - backplate_block_width) / 2, -1 * backplate_block_depth - 0.05, 0.1]) {
        cube([backplate_block_width, backplate_block_depth + 0.1, height - 0.2]);
      }
      translate([(width / 2) + (channel_width / 4), 0, 0]) {
        channel(rot=180, channel_padding=0.1);
      }
      // holes for threaded inserts
      translate([(width / 2) + (channel_width / 2) - 0.5, -1 * (channel_rib_depth / 2) - 0.2, height / 4]) {
        rotate([0, 90, 0]) {
          cylinder(h=channel_width / 2, d=insert_diam);
        }
      }
      translate([(width / 2) + (channel_width / 2) - 0.5, -1 * (channel_rib_depth / 2) - 0.2, (height / 4) * 2]) {
        rotate([0, 90, 0]) {
          cylinder(h=channel_width / 2, d=insert_diam);
        }
      }
      translate([(width / 2) + (channel_width / 2) - 0.5, -1 * (channel_rib_depth / 2) - 0.2, (height / 4) * 3]) {
        rotate([0, 90, 0]) {
          cylinder(h=channel_width / 2, d=insert_diam);
        }
      }
    }
  }
}

backplate();