module camera_mount(swivel_angle = 0, camera_angle = 0) {
    translate([0,0,0]){
        rotate([0,90,180]){
            import("../backup/cr10/CR10_Camera_Bracket_Thingiverse_4279932/files/Kamera_Bracket.stl");
        }
    }
    // BEGIN camera mount
    translate([-47,-103,-20]){
        // swivel
        translate([-125,105,0]){
            rotate([180,0,0]){
                import("../backup/cr10/IR-Pi_Cam_Prusa_i3_MK3MK3s_Camera_mount_Swivel_Package_Thingiverse_2873677/files/02_Arm_Swivel.stl");
            }
        }
        // BEGIN camera housing
        rotate([camera_angle,0,0]){
            translate([0,0,-14]){
                // back plate attachment
                translate([-125,-5,90.4]){
                    rotate([-90,0,0]){
                        import("../backup/cr10/IR-Pi_Cam_Prusa_i3_MK3MK3s_Camera_mount_Swivel_Package_Thingiverse_2873677/files/05_Cam_Backplate_Attachment.stl");
                    }
                }
                // back plate
                translate([-125,-3,88]){
                    rotate([-90,0,0]){
                        import("../backup/cr10/IR-Pi_Cam_Prusa_i3_MK3MK3s_Camera_mount_Swivel_Package_Thingiverse_2873677/files/03_Cam_Backplate_v2_WithIRConfigHoles.stl");
                    }
                }
                // front plate
                translate([-125.05,6.5,88]){
                    rotate([-90,0,0]){
                        import("../backup/cr10/IR-Pi_Cam_Prusa_i3_MK3MK3s_Camera_mount_Swivel_Package_Thingiverse_2873677/files/04_Cam_Frontplate_v2_WithIRConfigHoles.stl");
                    }
                }
                // END camera housing
            }
        }
    }
    // END camera mount
}
