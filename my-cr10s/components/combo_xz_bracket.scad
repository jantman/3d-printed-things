module combo_xz_bracket() {
    render() {
        intersection() {
            // this zeroes the model x,y,x
            translate([8.5,74,0]){
                rotate([90,0,90]){
                    import("../backup/cr10/Creality_CR-10_X_axis_cable_drag_chain_thingiverse_2923095/files/vert_combo_bracket_-40m_v3.stl");
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
    }
}
