use <modules/as_mm.scad>
include <config.scad>

as_mm(convert_to_mm) {
    union() {
        // this cube is the lower half of the template, below the cut
        cube([template_length, board_wide_face, board_narrow_face/2]);
        // cube on left side of cut
        difference() {
            translate([0,0,board_narrow_face/2]){
                cube([(template_length / 2) - (saw_kerf / 2),board_wide_face,board_narrow_face/2]);
            }
            translate([0,board_wide_face/2,board_narrow_face/2]){
                cylinder(h=board_narrow_face/2, d=router_bit_dia, center=false, $fn=24);
            }
        }
        // cube on right side of cut
        translate([(template_length / 2) + (saw_kerf / 2),0,board_narrow_face/2]){
            cube([(template_length / 2) - (saw_kerf / 2),board_wide_face,board_narrow_face/2]);
        }
        // nominal dimension text
        translate([
          template_length - 1.2,
          board_wide_face / 2,
          board_narrow_face
        ]){
            rotate([0,0,-90]){
                linear_extrude(text_height){
                    text(str(board_narrow_face/2, "\" depth"), size=0.25, font="Liberation Mono:style=Bold", halign="center", valign="bottom");
                }
            }
        }
        // URL text
        translate([
          template_length - 0.4,
          board_wide_face / 2,
          board_narrow_face
        ]){
            rotate([0,0,-90]){
                linear_extrude(text_height){
                    text("antman.us/halflap", size=0.2, font="Liberation Mono:style=Bold", halign="center", valign="top");
                }
            }
        }
    }
}
