module pencil()
{
  // extra space added to diameter of pencil
  pencil_padding = 0.003;
  // extra space added to diameter of shaft
  shaft_padding = 0.0015;
  // how much of the pencil shaft to include
  shaft_height = 0.5;
  //
  spacing = 0.2;

  // cone for the lead adjustment on the pencil
  cylinder(h=0.705, d1=0.07 + pencil_padding, d2=0.33 + pencil_padding, $fn=36);
  // shaft of the pencil
  translate([0,0,0.705]) {
    cylinder(h=shaft_height, d=0.33 + shaft_padding, $fn=36);
  }
  // cylinder representing the lead
  // NOTE the lead is actually ~0.02", but 0.05 is the smallest hole my 3d printer will print
  translate([0,0,-0.5]){
    cylinder(h=2, d=0.05, $fn=36);
  }
}
