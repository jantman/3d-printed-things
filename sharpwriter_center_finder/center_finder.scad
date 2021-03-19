include <config.scad>
use <pencil.scad>
use <plate.scad>
use <fin.scad>

difference() {
  union() {
    plate();
    // the "fin" handle/pencil holder
    translate([0, 0, plate_thickness]){
      fin();
    }
  }
  translate([0, 0, plate_thickness]) {
    pencil();
  }
}
