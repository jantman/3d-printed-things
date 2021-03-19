module support_leg()
{
  include <config.scad>
  cylinder(h=leg_height, d=leg_diameter, $fn=36);
}
