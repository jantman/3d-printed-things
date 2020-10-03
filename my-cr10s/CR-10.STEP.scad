use <cr10s_control_box.scad>
use <cr10s_printer.scad>

// set alpha of imported STL objects, from original CR-10 model
imported_alpha = 0.5;

// options / accessories
have_camera_mount = true;
have_pi_case = true;
have_microswiss = true;
have_z_cable_management = true;
have_y_cable_management = true;
have_x_cable_management = true;

// show or hide assemblies
show_control_box = false;
show_spool_holder = false;
show_printer = true;
show_slide_plate_assembly = true;

if(show_control_box == true){
    translate([-392,285.5,0]){
        cr10s_control_box(imported_alpha);
    }
}

if(show_spool_holder == true){
  translate([-392,285.5,0]){
      cr10s_control_box_spool_holder(imported_alpha);
  }
}

if(show_printer == true){
    cr10s_printer(imported_alpha, show_slide_plate_assembly, have_camera_mount, have_microswiss, have_x_cable_management, have_z_cable_management, have_y_cable_management, have_pi_case);
}
