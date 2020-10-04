max_x = 306;
max_y = 280;
layer_height = 0.2;
num_layers = 1;
line_width = 0.4;
num_lines = 1;

difference() {
    cube([max_x, max_y, layer_height * num_layers]);
    translate([line_width*num_lines,line_width*num_lines,0]){
        cube([max_x-((line_width*num_lines)*2),max_y-((line_width*num_lines)*2), layer_height * num_layers]);
    }
}
