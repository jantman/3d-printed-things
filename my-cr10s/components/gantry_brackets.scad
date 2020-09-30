use <camera_mount.scad>

module gantry_brackets(have_camera_mount = true, have_x_cable_management = true) {
    if(have_camera_mount == true) {
        translate([-5.5,283,295.75]){
            camera_mount(-76,10);
        }
    }
    if(have_x_cable_management == true) {
        translate([-43,281,227]){
            rotate([90,0,90]){
                import("../backup/cr10/Creality_CR-10_X_axis_cable_drag_chain_thingiverse_2923095/files/vert_combo_bracket_-40m_v3.stl");
            }
        }
    }
}
