spacing = inch(0.5);
spacing_str = "1/2\"";
spacer_width = inch(1);
spacer_height = inch(0.5);
backer_length = inch(3);
backer_thickness = inch(0.5);
text_depth = 2;

function inch(n) = 25.4 * n;

difference() {
    union() {
        // spacer bar
        cube([spacing, spacer_width, spacer_height]);
        // backing plate
        translate([-1 * (backer_length / 2) + (spacing / 2), 0, (-1 * backer_thickness) + 0.01]) {
            cube([backer_length, spacer_width, backer_thickness]);
        }
    }
    translate([spacing / 2, spacer_width / 2, spacer_height - (text_depth - 0.01)]) {
        rotate([0,0,90]){
            #linear_extrude(text_depth){
                text(spacing_str, size=5, font="Liberation Mono:style=Bold", halign="center", valign="center");
            }
        }
    }
}
