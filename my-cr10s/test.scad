use <components/carriage_cable_chain_bracket.scad>
use <components/camera_mount.scad>

// BEGIN copied from gantry_brackets.scad to modify here
/* module gantry_brackets(have_camera_mount = true, have_x_cable_management = true) {
    if(have_camera_mount == true) {
        translate([-5.5,283,295.75]){
            camera_mount(-90,0);
        }
    }
    if(have_x_cable_management == true) {
        render(){
            intersection() {
                translate([-43,281,227]){
                    rotate([90,0,90]){
                        import("../backup/cr10/Creality_CR-10_X_axis_cable_drag_chain_thingiverse_2923095/files/vert_combo_bracket_-40m_v3.stl");
                    }
                }
                union(){
                    translate([-52,280,304]){
                        rotate([0,90,0]){
                            cylinder(h=60,r=80);
                        }
                    }
                    translate([-56,300,220]){
                        cube([60,80,40],false);
                    }
                    translate([-56,200,320]){
                      cube([230,40,80],false);
                    }
                }
            }
        }
    }
} */

module xz_cable_bracket(){
    render(){
        intersection() {
            translate([-43,281,227]){
                rotate([90,0,90]){
                    import("../backup/cr10/Creality_CR-10_X_axis_cable_drag_chain_thingiverse_2923095/files/vert_combo_bracket_-40m_v3.stl");
                }
            }
            union(){
                translate([-52,280,304]){
                    rotate([0,90,0]){
                        cylinder(h=60,r=80);
                    }
                }
                translate([-56,300,220]){
                    cube([60,80,40],false);
                }
                translate([-56,200,320]){
                  cube([230,40,80],false);
                }
            }
        }
    }
}

module gantry_brackets(have_camera_mount = true, have_x_cable_management = true) {
    if(have_camera_mount == true) {
        translate([-5.5,283,295.75]){
            camera_mount(-90,0);
        }
    }
    if(have_x_cable_management == true) {
        xz_cable_bracket();
    }
}

// END copied from gantry_brackets.scad to modify here
gantry_brackets();
color("blue"){
    translate([8.5,74,0]){
        rotate([90,0,90]){
            import("../backup/cr10/Creality_CR-10_X_axis_cable_drag_chain_thingiverse_2923095/files/vert_combo_bracket_-40m_v3.stl");
        }
    }
}
