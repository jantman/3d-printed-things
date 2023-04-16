module carriage_cable_chain_bracket() {
    union(){
        difference() {
            translate([73,-4.5,0]){
                rotate([90,0,90]){
                    import("../backup/cr10/Creality_CR-10_X_axis_cable_drag_chain_thingiverse_2923095/files/x_bracket_v11.stl");
                }
            }
            translate([-1,-1,-1]){
                rotate([0,0,0]){
                    cube([80,12,36],false);
                }
            }
            translate([78,1.9,-1]){
                rotate([0,0,0]){
                    cube([50,9,36],false);
                }
            }
        }
        intersection(){
            difference() {
                translate([4,20,2]){
                    rotate([90,0,0]){
                        import("../backup/cr10/Ender_3_x_Micro_Swiss_Direct_Drive_Cable_Chain_Gantry_Mounts_thingiverse_4563903/files/Universal_Carriage_cablechain_mount_front_offset.stl");
                    }
                }
                translate([-20,-6,17]){
                    cube([40,40,20],false);
                }
            }
            translate([31.5,9,-33]){
                rotate([90,0,0]){
                    cylinder(h=7,r=51,center=false);
                }
            }
            union(){
                translate([8,2,0]){
                    cube([51,7,20],false);
                }
                translate([14.3,9,4]){
                    rotate([90,0,0]){
                        cylinder(h=7,r=10.375);
                    }
                }
            }
        }
        // extension back from carriage clip
        translate([55,2,2.7]){
            cube([66.8,7,10],false);
        }
        // tiny little extra bit on top of extension
        translate([52,2,9.7]){
            cube([8,7,3],false);
        }
        // support on top of extension
        // original translation x=55
        translate([30,2,12.7]){
            cube([91.8,7,5],false);
        }
        // backing block on box
        translate([79,0,0]){
            cube([42.8,4,26],false);
        }
    }
}
