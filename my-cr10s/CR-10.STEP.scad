use <components/rpi_case.scad>
use <cr10s_z_drive.scad>
use <cr10s_factory_extruder.scad>
use <cr10s_factory_fan_assembly.scad>
use <cr10s_factory_hotend.scad>
use <cr10s_factory_hotend_carriage.scad>
use <cr10s_factory_hotend_carriage_supports.scad>
use <components/microswiss_drive.scad>
use <components/carriage_cable_chain_bracket.scad>
use <components/gantry_brackets.scad>
use <cr10s_control_box.scad>
use <cr10s_printer.scad>

// set alpha of imported STL objects, from original CR-10 model
imported_alpha = 0.5;

// options / accessories
have_camera_mount = false;
have_pi_case = false;
have_microswiss = false;
have_z_cable_management = false;
have_y_cable_management = false;
have_x_cable_management = false;

// show or hide assemblies
show_control_box = false;
show_printer = true;
show_slide_plate_assembly = true;

if(show_control_box == true){
    translate([-392,285.5,0]){
        cr10s_control_box(imported_alpha);
    }
}

if(show_printer == true){
    color("red"){
        gantry_brackets(have_camera_mount, have_x_cable_management);
        if(have_pi_case == true) {
            translate([3.5,164,-1.5]){
                rpi_case();
            }
        }
        if(have_y_cable_management == true) {
            translate([35,352,22]){
                rotate([0,0,-20]){
                    import("../backup/cr10/Creality_CR-10_Y_axis_cable_drag_chain_thingiverse_2708420/files/bed_end_v4.stl");
                }
            }
        }
        if(have_z_cable_management == true) {
            translate([-77,360,26]){
                rotate([90,0,180]){
                    import("../backup/cr10/Creality_CR-10_Z_axis_cable_drag_chain_thingiverse_2757810/files/combo_YZ_bracket.stl");
                }
            }
        }
        if(have_x_cable_management == true) {
            translate([139,254.75,290]){
                rotate([0,0,0]){
                    carriage_cable_chain_bracket();
                }
            }
        }
    }
    if(have_microswiss == true) {
        translate([138,247,260]){
            microswiss_drive(imported_alpha);
        }
    }
    cr10s_printer(imported_alpha, show_slide_plate_assembly, have_camera_mount, have_microswiss);
}
