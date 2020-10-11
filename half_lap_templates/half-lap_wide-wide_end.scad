use <modules/as_mm.scad>
include <config.scad>

as_mm(convert_to_mm) {
    template_depth = board_wide_face * 1.5;
    difference() {
        // this cube represents the walls of the template. It will have no bottom
        translate([-1 * template_wall_thickness,-1 * template_wall_thickness,0]){
            cube([
              template_depth + template_wall_thickness,
              board_wide_face + template_padding + (template_wall_thickness * 2),
              board_narrow_face + template_padding + template_wall_thickness
            ]);
        }
        // this cube represents the inner face of the template, touching the lumber
        cube([template_depth, board_wide_face + template_padding, board_narrow_face + template_padding]);
        // cut-out for marking wide-face half-lap inner edge
        translate([board_wide_face-(board_wide_face/3),-1 * template_wall_thickness, board_narrow_face * 0.5]){
            cube([
              board_wide_face/3,
              board_wide_face + template_padding + (2 * template_wall_thickness),
              board_narrow_face
            ]);
        }
        // cutout for marking narrow-face half-lap inner edge
        translate([0,-1 * template_wall_thickness, board_narrow_face * 0.5]){
            cube([
              board_narrow_face * 0.5,
              board_wide_face + template_padding + (2 * template_wall_thickness),
              board_narrow_face
            ]);
        }
        // "wide face" text
        translate([
          board_wide_face + (2 * template_wall_thickness),
          board_wide_face / 2,
          board_narrow_face + template_wall_thickness
        ]){
            rotate([0,0,-90]){
                linear_extrude(2 * template_wall_thickness){
                    text("\u2193 WIDE FACE \u2193", size=0.25, font="Liberation Mono:style=Bold", halign="center", valign="center");
                }
            }
        }
        // "narrow face" text
        translate([
          (board_narrow_face / 2) + (2 * template_wall_thickness),
          board_wide_face / 2,
          board_narrow_face + template_wall_thickness
        ]){
            rotate([0,0,-90]){
                linear_extrude(2 * template_wall_thickness){
                    text("\u2193 END \u2193", size=0.25, font="Liberation Mono:style=Bold", halign="center", valign="center");
                }
            }
        }
        // nominal dimension text
        translate([
          board_wide_face * 1.4,
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
          board_wide_face * 1.25,
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
