use <backplate.scad>
use <mounting_bar.scad>

backplate();
translate([0, 0, 7]) {
    mounting_bar();
}
