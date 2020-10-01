module combo_xz_bracket() {
    render() {
        difference(){
            intersection() {
                // this zeroes the model x,y,x
                union(){
                    translate([8.5,74,0]){
                        rotate([90,0,90]){
                            import("../backup/cr10/Creality_CR-10_X_axis_cable_drag_chain_thingiverse_2923095/files/vert_combo_bracket_-40m_v3.stl");
                        }
                    }
                    // close the hole on the side
                    translate([0.5,18,20]){
                        cube([1.5,50,70],false);
                    }
                }
                union(){
                    translate([0.5,73,77]){
                        rotate([0,90,0]){
                            cylinder(h=60,r=80);
                        }
                    }
                    translate([-4.5,93,-7]){
                        cube([60,80,40],false);
                    }
                    translate([-4.5,-7,93]){
                      cube([230,40,80],false);
                    }
                }
            }
            // cutout for camera bracket
            translate([2,-2,40]){
                cube([20,20,20],false);
            }
        }
        intersection(){
            difference(){
                translate([0.5,73,77]){
                    rotate([0,90,0]){
                        cylinder(h=18,r=80);
                    }
                }
                translate([0.5,73,77]){
                    rotate([0,90,0]){
                        cylinder(h=18,r=78);
                    }
                }
            }
            translate([0.5,-5,0]){
                cube([60,60,46],false);
            }
        }
    }
}
