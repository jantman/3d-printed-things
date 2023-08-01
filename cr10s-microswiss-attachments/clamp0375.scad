$fn = 360;

show_carriage = false;

include <config.scad>
use <backplate.scad>
use <clamp.scad>

if(show_carriage && $preview) {
    translate([-128.125, 0, -25.18]) {
        rotate([90, 0, -90]) {
            import("../my-cr10s/models/madbuda_Micro_Swiss_Direct_Drive_thing_4170190/files/micro_swiss_DD_v2.stl");
        }
    }
}

backplate();
translate([0, inch(0.025), 0]) {
    clamp(inch(0.380), inch(0.480), inch(0.1));
}
