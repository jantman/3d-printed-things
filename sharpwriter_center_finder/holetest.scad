inches_to_mm = 25.4;
pencil_padding = 0.003;
shaft_padding = 0.0015;
spacing = 0.2;

difference() {
  translate([0, 0, 0]) {
    cube([3 * inches_to_mm, 1 * inches_to_mm, 0.1 * inches_to_mm]);
  }
  // 0.015"
  translate([0.25 * inches_to_mm,0.25 * inches_to_mm,-0.5 * inches_to_mm]){
    cylinder(h=2 * inches_to_mm, d=0.015 * inches_to_mm, $fn=36);
  }
  // 0.02"
  translate([0.5 * inches_to_mm,0.25 * inches_to_mm,-0.5 * inches_to_mm]){
    cylinder(h=2 * inches_to_mm, d=0.02 * inches_to_mm, $fn=36);
  }
  // 0.023"
  translate([0.75 * inches_to_mm,0.25 * inches_to_mm,-0.5 * inches_to_mm]){
    cylinder(h=2 * inches_to_mm, d=0.023 * inches_to_mm, $fn=36);
  }
  // 0.025"
  translate([1.0 * inches_to_mm,0.25 * inches_to_mm,-0.5 * inches_to_mm]){
    cylinder(h=2 * inches_to_mm, d=0.025 * inches_to_mm, $fn=36);
  }
  // 0.03"
  translate([1.25 * inches_to_mm,0.25 * inches_to_mm,-0.5 * inches_to_mm]){
    cylinder(h=2 * inches_to_mm, d=0.03 * inches_to_mm, $fn=36);
  }
  // 0.035"
  translate([1.5 * inches_to_mm,0.25 * inches_to_mm,-0.5 * inches_to_mm]){
    cylinder(h=2 * inches_to_mm, d=0.035 * inches_to_mm, $fn=36);
  }
  // 0.04"
  translate([1.75 * inches_to_mm,0.25 * inches_to_mm,-0.5 * inches_to_mm]){
    cylinder(h=2 * inches_to_mm, d=0.04 * inches_to_mm, $fn=36);
  }
  // 0.05"
  translate([2.0 * inches_to_mm,0.25 * inches_to_mm,-0.5 * inches_to_mm]){
    cylinder(h=2 * inches_to_mm, d=0.05 * inches_to_mm, $fn=36);
  }
  // 0.075"
  translate([2.25 * inches_to_mm,0.25 * inches_to_mm,-0.5 * inches_to_mm]){
    cylinder(h=2 * inches_to_mm, d=0.075 * inches_to_mm, $fn=36);
  }
  // 0.1"
  translate([2.5 * inches_to_mm,0.25 * inches_to_mm,-0.5 * inches_to_mm]){
    cylinder(h=2 * inches_to_mm, d=0.1 * inches_to_mm, $fn=36);
  }
  // 0.2"
  translate([2.8 * inches_to_mm,0.25 * inches_to_mm,-0.5 * inches_to_mm]){
    cylinder(h=2 * inches_to_mm, d=0.2 * inches_to_mm, $fn=36);
  }
}
