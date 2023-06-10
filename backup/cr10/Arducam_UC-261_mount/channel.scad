module channel(channel_padding = 0, rot = 0) {
  include <config.scad>
  w = width + (channel_padding * 2);
  crw = channel_rib_width + (channel_padding * 2);
  crd = channel_rib_depth + (channel_padding * 2);
  cw = channel_width;
  cd = channel_depth + (channel_padding * 2);

  translate([0, -1 * (crd + 0.1), 0]) {
    rotate([0, 0, rot]) {
      cube([crw, crd + 0.2, height]);
      translate([-1 * (cw / 4), -1 * (crd - 0.1), 0]) {
        cube([cw, cd - crd, height]);
      }
    }
  }
}