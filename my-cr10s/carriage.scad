use <components/camera_mount.scad>
use <components/rpi_case.scad>
use <cr10s_z_drive.scad>
use <cr10s_factory_extruder.scad>
use <cr10s_factory_fan_assembly.scad>
use <cr10s_factory_hotend.scad>
use <cr10s_factory_hotend_carriage.scad>
use <cr10s_factory_hotend_carriage_supports.scad>
use <microswiss_drive.scad>

imported_alpha = 0.5;
have_camera_mount = true;
have_pi_case = true;
have_microswiss = true;

color("red"){
    if(have_camera_mount) {
        translate([-5.5,283,295.75]){
            camera_mount(-76,10);
        }
    }
    if(have_pi_case) {
        translate([3.5,164,-1.5]){
            rpi_case();
        }
    }
}
if(have_microswiss == true) {
    translate([138,247,260]){
        microswiss_drive(imported_alpha);
    }
}
// carriage/bracket for second Z drive
color([0.2862745225429535, 0.6627451181411743, 0.2862745225429535, imported_alpha]) {
    translate([158,839,285]){
        rotate([90,0,0]){
            import("cornely_cool_x_gantry_RH_back_plate.stl");
        }
    }
}

// NOTE - the Z-axis drive has been split out into a module, to allow duplication for the second Z drive
translate([-392,285.5,0]){
    rotate([-90,0,-90]){
        cr10s_z_drive(imported_alpha);
        translate([0,0,360]){
            cr10s_z_drive(imported_alpha);
        }
        if(have_microswiss == false) {
            cr10s_factory_extruder(imported_alpha);
            cr10s_factory_hotend_carriage(imported_alpha);
            cr10s_factory_hotend_carriage_supports(imported_alpha);
            cr10s_factory_fan_assembly(imported_alpha);
            cr10s_factory_hotend(imported_alpha);
        }

        // CR-10 / Protal_frame_components / 2020-L415-A0-1_2020-L415-B0-1
        // X-axis / hotend carriage rail
        // Placement: Position=Vector (10.717294603288241, -30.633478301094858, 576.4134913604943) Rotation=Rotation (0.49999999999999956, -0.5000000000000002, -0.4999999999999999, 0.5000000000000004)
         color([0.2862745225429535, 0.6627451181411743, 0.2862745225429535, imported_alpha]) {  import("CR-10/Protal_frame_components/2020-L415-A0-1_2020-L415-B0-1.stl");  }
    }
}
