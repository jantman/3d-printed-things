// simple way to make a hexagon
// 7mm flat-to-flat is 8.08mm diameter
difference() {
  cylinder(d=8.08, h=22, $fn=6);
  cylinder(d=3.3, h=15, $fn=180);
}
translate([0, 0, 25]) {
  sphere(d=10, $fs=1);
}
