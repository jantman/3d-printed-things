## 3d-printed-things/xy_dimension_test

This is a simple dimension test, to find the maximum printable dimensions for your printer.

1. Set the variables in [dimension_test.scad](dimension_test.scad).
2. ``openscad -o dimension_test.stl dimension_test.scad``
3. Slice in cura. **Make sure to turn all adhesion off (i.e. no skirts)** and move the object as close to (0,0) as possible, since Cura will center it by default.
4. Print.

For my CR-10S, the reliable printable area is 296 wide (X) by 284 deep (Y). The lost Y space is from the binder clips on the bed. Cura won't let you print within 1mm of the edge of the bed, so in Cura, I have my Machine set to an X (Width) of 298 and a Y (Depth) of 286. Just to be safe, mine is set to a Z (Height) of 370, which is about as high as the gantry can go without having feed tube issues.
