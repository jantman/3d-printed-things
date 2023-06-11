module channel(channel_padding = 0, rot = 0) {
  include <config.scad>
  w = width + (channel_padding * 2);
  crw = channel_rib_width + (channel_padding * 2);
  crd = channel_rib_depth + (channel_padding * 2);
  cw = channel_width + (channel_padding * 2);
  cd = channel_depth;

  translate([0, -0.2, 0]) {
    rotate([0, 0, rot]) {
      cube([crw, crd + cd, height]);
      translate([-1 * (cw / 4), 0, 0]) {
        cube([cw, cd - crd + (channel_padding * 4), height]);
      }
    }
  }
}
