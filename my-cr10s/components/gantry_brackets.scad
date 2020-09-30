use <camera_mount.scad>
use <combo_xz_bracket.scad>

module gantry_brackets(have_camera_mount = true, have_x_cable_management = true) {
    if(have_camera_mount == true) {
        translate([-5.5,283,295.75]){
            camera_mount(-76,10);
        }
    }
    if(have_x_cable_management == true) {
        translate([-51.5,207,227]){
            combo_xz_bracket();
        }
    }
}
