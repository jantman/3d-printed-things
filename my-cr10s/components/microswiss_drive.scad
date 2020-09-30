use <../cr10s_factory_fan_assembly.scad>
use <../cr10s_factory_hotend.scad>
use <../cr10s_factory_hotend_carriage.scad>
use <../cr10s_factory_hotend_carriage_supports.scad>

module microswiss_drive(imported_alpha = 1.0) {
  translate([-84.5,0,-2.35]){
      rotate([90,0,-90]){
          import("madbuda_Micro_Swiss_Direct_Drive_thing_4170190/files/micro_swiss_DD_v2.stl");
      }
  }
  translate([-529.5,39.5,-259.85]){
      rotate([-90,0,-90]){
          cr10s_factory_hotend_carriage_supports(imported_alpha);
      }
  }
  translate([-534.5,29.5,-259.85]){
      rotate([-90,0,-90]){
          cr10s_factory_fan_assembly(imported_alpha);
          cr10s_factory_hotend(imported_alpha);
      }
  }
  translate([-21.5,319,511.15]){
      rotate([0,180,0]){
          color([0.800000011920929, 0.800000011920929, 0.800000011920929, imported_alpha]) {  import("CR-10/Protal_frame_components/Motor_holder_components/40-42_motor001.stl");  }
          color([0.5921568870544434, 0.6666666865348816, 0.5921568870544434, imported_alpha]) {  import("CR-10/Protal_frame_components/Motor_holder_components/E_gear.stl");  }
      }
  }
  color("blue"){
      translate([44,-10,42]){
          cylinder(200, 2, false);
      }
  }
  color("silver"){
      translate([50,-9.5,50]){
          cube([6.7,8,56],false);
      }
      translate([56.7,-5.5,87.5]){
          rotate([90,0,90]){
            cylinder(h=6.7, d=11, center=false);
            translate([0,0,-34.8]){
                cylinder(h=2, d=9.5, center=false);
                cylinder(h=41.5, d=3, center=false);
            }
          }
      }
      translate([52,-0,70]){
          rotate([90,0,0]){
              cylinder(h=13.75,d=14.6,center=false);
          }
      }
  }
}
