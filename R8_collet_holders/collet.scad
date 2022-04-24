// originally from: https://www.thingiverse.com/thing:4106427
$fn=180;

//------------------------------------------------------
//------------------------------------------------------

module endmill_collet(base_diam, max_diam, total_len, tolerance) {
  chamfir_len = inch(0.025);

  shaft_len = inch(2.93) + tolerance*2;
  taper_len = total_len - shaft_len;
  // ---------------------------------
  wall_thick = inch(1/8);
  hollow_shaft_diam = base_diam - wall_thick;
  hollow_shaft_past_key_slot_diam = base_diam - wall_thick;
  hollow_max_taper_diam = max_diam - wall_thick;

  union() { //addative
    collet(base_diam, chamfir_len, shaft_len, max_diam, taper_len);
    translate([0,0,total_len])
    cylinder(d=max_diam, h=4.5);
  }
}

module collet(base_diam, chamfir_len, shaft_len, max_diam, taper_len) {
  union() {
    cylinder(d1=base_diam - chamfir_len*2, d2=base_diam, h=chamfir_len);
    translate([0,0,chamfir_len])
    cylinder(d=base_diam, h=shaft_len-chamfir_len);
    translate([0,0,shaft_len])
      cylinder(d1=base_diam, d2=max_diam, h=taper_len);
  }
}

function inch(n) = 25.4 * n;
