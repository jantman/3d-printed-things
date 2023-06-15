$fn = 360;

id = 29;
od = 31.9;
thickness = 4;

difference() {
    cylinder(h=thickness, d=od, center=true);
    cylinder(h=thickness, d=id, center=true);
}
