inches_to_mm = 25.4;
pencil_padding = 0.003;
spacing = 0.2;

difference() {
  translate([-1 * spacing * inches_to_mm, -1 * spacing * inches_to_mm,-0.1 * inches_to_mm]) {
    cube([spacing * 2.0 * inches_to_mm, spacing * 2.0 * inches_to_mm, 1.305 * inches_to_mm]);
  }
  cylinder(h=0.705 * inches_to_mm, d1=(0.07 + pencil_padding) * inches_to_mm, d2=(0.33 + pencil_padding) * inches_to_mm, $fn=36);
  translate([0,0,0.705 * inches_to_mm]) {
    cylinder(h=0.5 * inches_to_mm, d=(0.33 + pencil_padding) * inches_to_mm, $fn=36);
  }
  translate([0,0,-0.5 * inches_to_mm]){
    cylinder(h=0.7 * inches_to_mm, d=(0.02 + pencil_padding) * inches_to_mm, $fn=36);
  }
}
