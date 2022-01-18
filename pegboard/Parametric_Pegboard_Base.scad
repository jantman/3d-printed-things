// FROM: https://www.thingiverse.com/thing:2583402

 // What size are the holes that we'll be going into?  Standard U.S. pegboard holes are 0.25" diameter
 hole_size = 0.25 * 25.4;

 // How far undersized should the pegs be to actually fit in the holes?
 peg_clearance = 0.25;

 // How thick is your pegboard?
 peg_height = 0.125 * 25.4;

 // What angle should the top pegs be bent at?
 peg_angle = 60;

 // Hole spacing.  Standard pegboard holes are 1" on center
 hole_center_to_center = 1 * 25.4;

 // How many rows of pegs?
 peg_rows = 2;

 // How many columns of pegs?
 peg_cols = 2;

 // How thick do you want the base?
 base_depth = 5;

 // ------------------- END PARAMETERS -----------------

//pegboard_base(peg_cols, peg_rows, hole_center_to_center, peg_height, base_depth, hole_size, peg_clearance, peg_angle);

//pegboard_base();

module pegboard_base(
cols = peg_cols,
rows = peg_rows,
spacing = hole_center_to_center,
height = peg_height,
depth = base_depth,
hole_size = hole_size,
clearance = peg_clearance,
angle = peg_angle)

{
    radius = hole_size / 2 - clearance;

    translate([spacing * (cols - 0.5), -depth, spacing / 2])
    rotate([180,180,0])
    {
        translate([-spacing / 2, -depth, -spacing / 2])
        cube([cols * spacing, depth, rows * spacing]);
        peg_grid(cols, rows, spacing, height, radius, angle);
    }
}

module peg_grid(cols, rows, spacing, height, radius, angle)
{
    for(row = [0 : rows - 2])
    {
        translate([0,0, row * spacing])
        peg_row(cols, spacing, height, radius);
    }

    translate([0, 0, (rows - 1) * spacing])
    top_peg_row(cols, spacing, height, radius, angle);
}

module top_peg_row(cols, spacing, height, radius, angle)
{
    peg_row(cols, spacing, height, radius, angle);
}

module peg_row(cols, spacing, height, radius, angle = 0)
{
    for(col = [0 : cols - 1])
    {
        translate([col * spacing, 0, 0])
        if(angle == 0) {
            rounded_peg(radius, height);
        } else {
            top_peg(radius, height, angle);
        }
    }
}

module top_peg(radius, height, angle = 60)
{
    rotate([0, 90, 0])
    {
        // Base peg
        peg(radius, height);

        // Bend
        translate([-2 * radius, height, 0])
        rotate_extrude2(angle = angle)
        translate([2 * radius, 0])
        circle(r = radius);

        // Extended peg
        translate([-2 * radius, height, 0])
        rotate([0,0,angle])
        translate([2 * radius, 0, 0])
        rounded_peg(radius, height);
        }
}

module rounded_peg(radius, height)
{
    peg(radius, height);
    translate([0, height, 0])
    sphere(r = radius);
}

module peg(radius, height)
{
    rotate([-90, 0, 0])
    cylinder(r = radius, h = height);
}

  //-------------- EXTERNAL MODULES -------------------

  // http://forum.openscad.org/rotate-extrude-angle-always-360-td19035.html
  module rotate_extrude2(angle=360, convexity=2, size=1000) {

  module angle_cut(angle=90,size=1000) {
    x = size*cos(angle/2);
    y = size*sin(angle/2);
    translate([0,0,-size])
      linear_extrude(2*size) polygon([[0,0],[x,y],[x,size],[-size,size],[-size,-size],[x,-size],[x,-y]]);
  }

  // support for angle parameter in rotate_extrude was added after release 2015.03
  // Thingiverse customizer is still on 2015.03
  angleSupport = (version_num() > 20150399) ? true : false; // Next openscad releases after 2015.03.xx will have support angle parameter
  // Using angle parameter when possible provides huge speed boost, avoids a difference operation

  if (angleSupport) {
    rotate_extrude(angle=angle,convexity=convexity)
      children();
  } else {
    rotate([0,0,angle/2]) difference() {
      rotate_extrude(convexity=convexity) children();
      angle_cut(angle, size);
    }
  }
}
