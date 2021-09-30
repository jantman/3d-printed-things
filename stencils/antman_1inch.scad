use <Write.scad>;

// BEGIN configuration
stencil_thickness_mm = 1;
letter_height_inches = 1;
word = "ANTMAN";
// END configuration

mm = letter_height_inches * 25.4;
space = 1.2;

difference() {
  translate([-25,-1 * mm,0]) {
    cube([(mm * len(word)) + 25, mm * 3, stencil_thickness_mm]);
  }
  write(word, h=mm, t=stencil_thickness_mm, font="stencil_TNH.dxf", space=space);
}
