include <config.scad>;
use <wall_plate.scad>;
use <remote_holder.scad>;

union() {
    plate(height_inches=inch(4.85), width_inches=inch(3.125));
    translate([0, inch(0.1), -1 * inch(0.09)]) {
        remote_holder();
    }
}
