include <config.scad>;
use <wall_plate.scad>;
use <remote_holder.scad>;

plate(height_inches=inch(4.85), width_inches=inch(3.125));
remote_holder();
