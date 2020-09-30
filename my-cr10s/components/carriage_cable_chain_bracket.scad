module carriage_cable_chain_bracket() {
    translate([73,-4.5,0]){
        rotate([90,0,90]){
            import("../backup/cr10/Creality_CR-10_X_axis_cable_drag_chain_thingiverse_2923095/files/x_bracket_v11.stl");
        }
    }
    //import("../backup/cr10/Ender_3_x_Micro_Swiss_Direct_Drive_Cable_Chain_Gantry_Mounts_thingiverse_4563903/files/Universal_Carriage_cablechain_mount_front_offset.stl");
}
