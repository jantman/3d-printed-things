max_x = 302; // cura seems to need 1mm cut off each side in order to slice
max_y = 268; // cura seems to need 1mm cut off each side in order to slice
layer_height = 0.2;
num_layers = 1;
line_width = 1;
num_lines = 1;
corner_cube_size = 30;
object_height = layer_height * num_layers;

difference() {
    cube([max_x, max_y, object_height]);
    translate([line_width*num_lines,line_width*num_lines,0]){
        cube([max_x-((line_width*num_lines)*2),max_y-((line_width*num_lines)*2), object_height]);
    }
}
// bottom left corner
cube([corner_cube_size, corner_cube_size, object_height]);
// bottom right corner
translate([max_x - corner_cube_size, 0, 0]){
    cube([corner_cube_size, corner_cube_size, object_height]);
}
// top left corner
translate([0, max_y - corner_cube_size, 0]){
    cube([corner_cube_size, corner_cube_size, object_height]);
}
// top right corner
translate([max_x - corner_cube_size, max_y - corner_cube_size, 0]){
    cube([corner_cube_size, corner_cube_size, object_height]);
}
// middle left
translate([0, (max_y/2) - (corner_cube_size-2), 0]){
    cube([corner_cube_size, corner_cube_size, object_height]);
}
// middle bottom
translate([(max_x/2) - (corner_cube_size/2), 0, 0]){
    cube([corner_cube_size, corner_cube_size, object_height]);
}
// middle right
translate([max_x - corner_cube_size, (max_y/2) - (corner_cube_size-2), 0]){
    cube([corner_cube_size, corner_cube_size, object_height]);
}
// middle top
translate([(max_x/2) - (corner_cube_size/2), max_y - corner_cube_size, 0]){
    cube([corner_cube_size, corner_cube_size, object_height]);
}
