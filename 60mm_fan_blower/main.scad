intersection() {
  union() {
    difference() {
      translate([-2,-2,0]) {
        cube([65, 65, 12]);
      }
      translate([0,0,0]) {
        cube([61, 61, 10]);
      }
      translate([5.125,5.125,0]) {
        cylinder(h=40, d=4.25, $fn=36);
      }
      translate([54.875,54.875,0]) {
        cylinder(h=40, d=4.25, $fn=36);
      }
      translate([5.125,54.875,0]) {
        cylinder(h=40, d=4.25, $fn=36);
      }
      translate([54.875,5.125,0]) {
        cylinder(h=40, d=4.25, $fn=36);
      }
      translate([30.5,30.5,0]) {
        cylinder(h=40, d=58, $fn=36);
      }
    }
    difference() {
      translate([30.5,30.5,10]) {
        cylinder(h=40, d1=62, d2=22, $fn=36);
      }
      translate([30.5,30.5,10]) {
        cylinder(h=40, d1=60, d2=20, $fn=36);
      }
    }
    difference() {
      translate([30.5,30.5,50]) {
        cylinder(h=10, d=22, $fn=36);
      }
      translate([30.5,30.5,50]) {
        cylinder(h=10, d=20, $fn=36);
      }
    }
  }
  translate([-3,-3,9]) {
    cube([66, 66, 2]);
  }
}
