use <modules/as_mm.scad>
include <config.scad>

as_mm(convert_to_mm) {
    template_depth = board_narrow_face * 3;
    difference() {
        // this cube represents the walls of the template. It will have no bottom
        translate([0,-1 * template_wall_thickness,0]){
            cube([
              template_depth,
              board_wide_face + template_padding + (template_wall_thickness * 2),
              board_narrow_face + template_padding + template_wall_thickness
            ]);
        }
        // this cube represents the inner face of the template, touching the lumber
        cube([template_depth, board_wide_face + template_padding, board_narrow_face + template_padding]);
        // cut-out for marking wide-face half-lap inner edge
        translate([board_narrow_face,-1 * template_wall_thickness, board_narrow_face * 0.5]){
            cube([
              board_narrow_face,
              board_wide_face + template_padding + (2 * template_wall_thickness),
              board_narrow_face
            ]);
        }
        // nominal dimension text
        translate([
          board_narrow_face * 2.5,
          board_wide_face / 2,
          board_narrow_face + template_wall_thickness
        ]){
            rotate([0,0,-90]){
                linear_extrude(2 * template_wall_thickness){
                    text(nominal_size, size=0.25, font="Liberation Mono:style=Bold", halign="center", valign="bottom");
                }
            }
        }
        // URL text
        translate([
          board_wide_face * 0.25,
          board_wide_face / 2,
          board_narrow_face + template_wall_thickness
        ]){
            rotate([0,0,-90]){
                linear_extrude(2 * template_wall_thickness){
                    text("antman.us/halflap", size=0.2, font="Liberation Mono:style=Bold", halign="center", valign="bottom");
                }
            }
        }
    }
}
