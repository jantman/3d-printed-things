module fin() {
  include <config.scad>
  union() {
    difference() {
      union() {
        translate([-0.5 * fin_length,-0.5 * fin_thickness,0]) {
          cube([fin_length, fin_thickness, fin_height]);
        }
      }
      translate([fin_length * -0.75,fin_thickness * -0.5,fin_height]) {
        rotate([0, 90, 0]) {
          cylinder(h=fin_length * 1.5, d=fin_thickness, $fn=36);
        }
      }
      translate([fin_length * -0.75,fin_thickness * 0.5,fin_height]) {
        rotate([0, 90, 0]) {
          cylinder(h=fin_length * 1.5, d=fin_thickness, $fn=36);
        }
      }
    }
  }
  translate([fin_length * -0.5,0,fin_height * 0.75]) {
    rotate([0, 90, 0]) {
      cylinder(h=fin_length, d=fin_thickness, $fn=36);
    }
  }
}
