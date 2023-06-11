use <backplate.scad>
use <mounting_bar.scad>

intersection() {
    translate([0, -20, 0]) {
        cube([40, 40, 14]);
    }
    union() {
        backplate();
        translate([0, -10, 0]) {
            mounting_bar();
        }
    }
}
