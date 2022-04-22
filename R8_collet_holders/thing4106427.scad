$fn=72;

use <./polyScrewThread-rkt.scad>

show_base_collet        = 1;
show_endmill_collet     = 0;
  show_curved_top       = 1;
show_tool_cap           = 0;
show_screw              = 0;
show_threads            = 0;

show_morse_3_taper      = 0;

//------------------------------------------------------
//------------------------------------------------------

tolerance = 0.5;

base_diam = inch(0.9495) - tolerance*2;
max_diam  = inch(1.25) - tolerance*2;
chamfir_len = inch(0.025);

shaft_len = inch(2.93);
total_len = inch(3.98);
taper_len = total_len - shaft_len;

//attachemetnt is 7/26-20 NF
screw_hole_diam = inch(7/16) + tolerance*2;
screw_hole_depth = inch(1);
screw_hole_TPI = 20;

key_width = inch(0.161);
key_depth = inch(0.065);
key_length = inch(2.625);


//Below would be adjustable for particular application
//Not part of R8 spec
tool_cap_diam = inch(1.5) - tolerance*2;
tool_cap_len = inch(0.75) - tolerance*2;

//------------------------------------------------------
//------------------------------------------------------

if (show_base_collet) {
  collet();  
}

if (show_tool_cap) {
  translate([0,0,total_len])
    cylinder(d=tool_cap_diam, h=tool_cap_len);
}

if (show_screw) {
  thread(inch(1/2), 18, inch(1));  
  cylinder(d=inch(1/2), h=inch(1/2));
}  

if (show_endmill_collet) {
  endmill_collet();
}  

if (show_morse_3_taper) {
  morse_3_taper();
}  
//------------------------------------------------------
//------------------------------------------------------


module morse_3_taper(max_diam = inch(2), length = inch(5)) {
 
  taper = 0.60235;  //taper inches/foot
  taper_per_inch = taper/12;
  
  large_diam = max_diam;
  small_diam = large_diam - (length * taper_per_inch);
  
  cylinder(d1=small_diam, d2=large_diam, h = length);
  
}  


*intersection() {
  endmill_collet();
  translate([-25,-25,0])
    cube([50,50,90]);
}  

module endmill_collet(endmill_diam = inch(3/8)) {
  
  slit_width = inch(1/32);
  wall_thick = inch(1/8);
  hollow_shaft_diam = base_diam - key_depth - wall_thick;
  hollow_shaft_past_key_slot_diam = base_diam - wall_thick;
  hollow_max_taper_diam = max_diam - wall_thick;
  
  difference() {
    union() { //addative
      collet();
      if (show_curved_top) {
        translate([0,0,total_len])
        curve_top(rad=65, diam=max_diam);
      }  
    }
    union() { //subtractive
      translate([0,0, screw_hole_depth-0.2])
      cylinder(d1=screw_hole_diam, d2=hollow_shaft_diam, 
               h=inch(1/2)+0.1);

      translate([0,0, screw_hole_depth + inch(1/2) -0.2])
      cylinder(d=hollow_shaft_diam, 
               h=key_length - screw_hole_depth - inch(1/2) +0.1);

      translate([0,0, key_length-0.2])
      cylinder(d1=hollow_shaft_diam, d2=endmill_diam, //d2=hollow_shaft_past_key_slot_diam,
               h=shaft_len - key_length);


      *translate([0,0, shaft_len-0.3])
      cylinder(d1=hollow_shaft_past_key_slot_diam, d2 = hollow_max_taper_diam,
               h=taper_len - wall_thick);

      for (angle=[60:120:359]) {
        rotate([0,0,angle])
        translate([0, -slit_width/2, key_length/2])
        cube([max_diam/2, slit_width, shaft_len]);
      }  

      translate([0,0,shaft_len-0.4])
      cylinder(d=endmill_diam, h=inch(2));
      
      
    }
  }   
}  

module curve_top(rad = 100, diam = 40, h=2) {
  
  intersection() {
    translate([0,0,-rad + h])
      sphere(r=rad, $fn=100);  
    cylinder(d=diam, h=h*2);
  }  
}  

module collet() {
  difference() {
    union() {    
      cylinder(d1=base_diam - chamfir_len*2, d2=base_diam, h=chamfir_len);  
      translate([0,0,chamfir_len])  
      cylinder(d=base_diam, h=shaft_len-chamfir_len);
      translate([0,0,shaft_len])
        cylinder(d1=base_diam, d2=max_diam, h=taper_len); 
    }
    union() { //subtractive
      translate([base_diam/2 - key_depth, -key_width/2, -0.01])
        cube([key_depth+0.1, key_width, key_length]);  
        
      if (show_threads) {
        translate([0,0,-0.1]) 
         thread(screw_hole_diam, screw_hole_TPI, screw_hole_depth);   
      } else {
        translate([0,0,-0.1])  
        cylinder(d=screw_hole_diam, h=screw_hole_depth);  
      }  
    }   
  }
}

function inch(n) = 25.4 * n;


module thread(diam, pitch, length) {
  step = length / pitch;
  screw_thread(diam,   // Outer diameter of the thread
               step,   // Step, traveling length per turn, also, tooth height, whatever...
                 30,   // Degrees for the shape of the tooth 
                       // (XY plane=0, Z=90, btw, 0 and 90 will not work...)
               length, // Length (Z) of the tread
               PI/8,   // Resolution, one face each "PI/2" mm of the perimeter, 
                  1);  // Countersink style:
                       //     -2 - Not even flat ends
                       //     -1 - Bottom (countersink'd and top flat)
                       //     0 - None (top and bottom flat)
                       //      1 - Top (bottom flat)
                       //      2 - Both (countersink'd)     
}