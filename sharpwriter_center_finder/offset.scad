module offset(label, length, thickness, offset_num)
{
  include <config.scad>

  translate([0,thickness * offset_num * -1,0]) {
    translate([length * -0.5,(plate_width * -0.5) - thickness,0]) {
      cube([length, thickness, plate_thickness]);
    }
    translate([length * -0.5,(plate_width * -0.5),0]) {
      cylinder(h=plate_thickness, r = thickness, $fn=36);
    }
    translate([length * 0.5,(plate_width * -0.5),0]) {
      cylinder(h=plate_thickness, r = thickness, $fn=36);
    }
    // text for the offset width
    translate([(length * -0.5) + 0.1 + (offset_num * 0),-0.65 * plate_width,plate_thickness]) {
      linear_extrude(height=0.125) {
        text(label, size=0.15, valign="bottom", halign="center", spacing=1);
      }
    }
  }
}
