module channel(use_padding = 0, rot = 0) {
  include <config.scad>
  cp = channel_padding * use_padding * 2;
  w = width + cp;
  crw = channel_rib_width + cp;
  crd = channel_rib_depth + cp;
  cw = channel_width + cp;
  cd = channel_depth;

  translate([0, -0.2, 0]) {
    rotate([0, 0, rot]) {
      cube([crw, crd + cd, height]);
      translate([-1 * (cw / 4), 0, 0]) {
        cube([cw, cd - crd + (cp * 2), height]);
      }
    }
  }
}
