use <modules/as_mm.scad>
include <config.scad>

as_mm(convert_to_mm) {
    template_depth = board_narrow_face * 2;
    difference() {
        // this cube represents the walls of the template. It will have no bottom
        translate([-1 * template_wall_thickness,-1 * template_wall_thickness,0]){
            cube([
              template_depth + template_wall_thickness,
              board_narrow_face + template_padding + (template_wall_thickness * 2),
              board_wide_face + template_padding + template_wall_thickness
            ]);
        }
        // this cube represents the inner face of the template, touching the lumber
        cube([template_depth, board_narrow_face + template_padding, board_wide_face + template_padding]);
        // cutout for marking narrow-face half-lap inner edge
        translate([0,-1 * template_wall_thickness, board_wide_face * 0.5]){
            cube([
              board_narrow_face,
              board_narrow_face + template_padding + (2 * template_wall_thickness),
              (board_wide_face * 0.5) + template_padding + template_wall_thickness
            ]);
            echo(str("Opening will be ", board_wide_face * 0.5, " long x ", board_narrow_face, " deep x ", board_wide_face * 0.5, " high"));
        }
        // nominal dimension text
        translate([
          board_narrow_face * 1.4,
          board_narrow_face / 2,
          board_wide_face + template_wall_thickness
        ]){
            rotate([0,0,-90]){
                linear_extrude(2 * template_wall_thickness){
                    text(nominal_size, size=0.25, font="Liberation Mono:style=Bold", halign="center", valign="bottom");
                }
            }
        }
        // URL text won't fit
    }
}
