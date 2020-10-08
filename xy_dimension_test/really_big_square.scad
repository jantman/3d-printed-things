max_x = 296; // cura seems to need 1mm cut off each side in order to slice
max_y = 284; // cura seems to need 1mm cut off each side in order to slice
layer_height = 0.2;
num_layers = 1;
object_height = layer_height * num_layers;

cube([max_x, max_y, object_height]);
