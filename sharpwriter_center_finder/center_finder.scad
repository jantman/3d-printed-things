include <config.scad>
use <pencil.scad>
use <plate.scad>
use <fin.scad>
use <offset.scad>

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
offset("1/4", fin_length * 1.35, 0.125, 0);
offset("3/8", fin_length * 1.15, 0.125, 1);
offset("1/2", fin_length * 0.95, 0.125, 2);
offset("5/8", fin_length * 0.75, 0.125, 3);
offset("3/4", fin_length * 0.55, 0.125, 4);
