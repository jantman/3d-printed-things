// All dimensions in INCHES
convert_to_mm = false;

nominal_size = "2x4"; // name of the nominal size
board_wide_face = 3.5; // nominal 4"
board_narrow_face = 1.5; // nominal 2"

/*
This defines how much larger the inner dimensions of the template are than the
board, to account for slightly oversize boards or moisture swelling. Measuring
my current batch of 2x4s with calipers, I found that setting the calipers at
3.55" for the wide face, and 1.55" for the narrow face, let them slide over
all of the boards. So, we set the padding to 0.05".
*/
template_padding = 0.05;

// Thickness of the template walls
template_wall_thickness = 3/32;

// Length of the depth template
template_length = 4.0;

// Width of the cut in the depth gauge
saw_kerf = 0.2;

// Diameter of the router bit hole in the depth gauge
router_bit_dia = 1.4;

// Height of raised text
text_height = 1/16;
