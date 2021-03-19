use <support_leg.scad>

module plate()
{
  include <config.scad>
  union() {
    // the main portion of the plate
    translate([-0.5 * (lumber_thickness + plate_width),-0.5 * plate_width, 0]) {
      cube([lumber_thickness + plate_width, plate_width, plate_thickness]);
    }
    // the left end radius
    translate([-0.5 * (lumber_thickness + plate_width),0,0]) {
      cylinder(h=plate_thickness, d=plate_width, $fn=36);
    }
    // the left support leg
    translate([-0.5 * (lumber_thickness + leg_diameter),0,-1 * leg_height]) {
      support_leg();
    }
    // the right end radius
    translate([0.5 * (lumber_thickness + plate_width),0,0]) {
      cylinder(h=plate_thickness, d=plate_width, $fn=36);
    }
    // the right support leg
    translate([0.5 * (lumber_thickness + leg_diameter),0,-1 * leg_height]) {
      support_leg();
    }
    // text for the offset width
    translate([-0.4 * lumber_thickness,-0.55 * plate_width,plate_thickness]) {
      linear_extrude(height=0.125) {
        text("1/8", size=0.15, valign="bottom", halign="center", spacing=1);
      }
    }
    // @TODO - FIXME - Update these
    // testing various text methods
    translate([-0.2 * lumber_thickness,-0.55 * plate_width,plate_thickness]) {
      linear_extrude(height=0.1) {
        text("1/8", size=0.15, valign="bottom", halign="center", spacing=1);
      }
    }
    translate([0,-0.55 * plate_width,plate_thickness]) {
      linear_extrude(height=0.05) {
        text("1/8", size=0.15, valign="bottom", halign="center", spacing=1);
      }
    }
    translate([0.2 * lumber_thickness,-0.55 * plate_width,plate_thickness]) {
      linear_extrude(height=0.025) {
        text("1/8", size=0.15, valign="bottom", halign="center", spacing=1);
      }
    }
  }
}
