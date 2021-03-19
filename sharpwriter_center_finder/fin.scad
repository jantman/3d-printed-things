module fin() {
  include <config.scad>
  translate([-0.5 * fin_length,-0.5 * fin_thickness,0]) {
    cube([fin_length, fin_thickness, fin_height]);
  }
}
