include <config.scad>;
use <wall_plate.scad>;
use <remote_holder.scad>;

difference() {
    remote_holder(back_thickness=inch(0.25));
    translate([0, inch(-0.07), 0]) {
        plate_openings(inch(0.25), inch(0.25));
    }
}
