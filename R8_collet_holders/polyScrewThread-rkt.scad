/*
 *    polyScrewThread_r1.scad    by aubenc @ Thingiverse
 *
 * This script contains the library modules that can be used to generate
 * threaded rods, screws and nuts.
 *
 * http://www.thingiverse.com/thing:8796
 *
 * CC Public Domain
 */
 
 /*
  *  Modified by K. Toppenberg (//kt)
  *  renamed to polyScrewThread_rkt.scad
  *  11/2017
  *
  *  CC Public Domain
  *
  */

//NOTE: examples are below library code, at bottom of this file. 
//      Set value to 1 to show example, 0 to hide
show_example_1 = 0;   //A 100mm long threaded rod.
show_example_2 = 0;   //A nut for the previous example.
show_example_3 = 0;   //A screw, threaded all the way, with hex head.
show_example_4 = 0;   //A screw with a non threaded section and with hex head.
show_example_5 = 0;   //A rod with a middle section without thread and, a portion of it, hex shaped.
                          //   And one end is threaded in the opposite direction than the other.
show_example_6 = 1;   //a screw lid and screw jar
  show_lid  = 1;
  show_base = 1;
  
example_display_x_offset = 30;  //spacing for displaying examples

PI=3.141592;


module hollow_screw_thread(od, wt, bt, tt, sth, lf0, lt, tl, rs, cs) {  //kt added  
  //Purpose: This creates a tube that may be optionally capped at either end (top or base)
  //         One end may be threaded for a specified distance.  
  //od:   Outer diameter of the thread
  //wt:   wall thickness
  //bt:   base thickness (may be zero)
  //tt:   top thickness (may be zero)
  //sth:  Thread step
  //lf0:  Step shape degrees.  Step, traveling length per turn, also, tooth height, whatever...   
  //lt:   Length of the threaded section of the screw.  Length (Z) of the tread
  //tl:   Total length of object (tl = lt + unthreaded_length)
  //rs:   Resolution (face at each 2mm of the perimeter)
  //cs:   Countersink in both ends.  Countersink style:
  //         -2 - Not even flat ends
  //         -1 - Bottom (countersink'd and top flat)
  //          0 - None (top and bottom flat)
  //          1 - Top (bottom flat)
  //          2 - Both (countersink'd)  
  
  id = od - wt*2;  
  ntl = tl - lt;
  extra_z_for_bt = 1;
  extra_z_for_tt = 1;
  cutout_z = tl - tt - bt;
  
  difference() {
    //screw_thread(od, sth, lf0, lt, rs, cs);    
    hex_screw(od,    //od :  Outer diameter of the thread
              sth,   //sth:  Thread step
              lf0,   //lf0:  Step shape degrees
              lt,    //lt:   Length of the threaded section of the screw
              rs,    //rs:   Resolution (face at each 2mm of the perimeter)
              cs,    //cs:   Countersink in both ends
              0,     //df:   Distance between flats for the hex head
              0,     //hg:   Height of the hex head (can be zero)
              ntl,   //ntl:  Length of the non threaded section of the screw (can be zero)
              0      //ntd:  Diameter for the non threaded section of the screw
                        //     -1 - Same as inner diameter of the thread
                        //      0 - Same as outer diameter of the thread
                        //  value - The given value
    );     
    if ((bt == 0) && (tt == 0)) {   
      translate([0,0, -extra_z_for_bt])
        cylinder(d=id, h=cutout_z + extra_z_for_bt + extra_z_for_tt, $fn=100);    
    } else if ((bt == 0) && (tt != 0)) {    
      translate([0,0,bt - extra_z_for_bt])
        cylinder(d=id, h=cutout_z + extra_z_for_bt, $fn=100);    
    } else if ((bt != 0) && (tt == 0)) {    
      translate([0,0,bt])
        cylinder(d=id, h=cutout_z + extra_z_for_tt, $fn=100);    
    } else if ((bt != 0) && (tt != 0)) {    
      translate([0,0,0])
        cylinder(d=id, h=cutout_z, $fn=100);    
    }  
  }    
}  


module screw_thread(od,sth,lf0,lt,rs,cs)  {
  //od:   Outer diameter of the thread
  //sth:   Thread step 
  //lf0:  Step shape degrees.  Step, traveling length per turn, also, tooth height, whatever...   
  //lt:   Length of the threaded section of the screw.  Length (Z) of the tread
  //rs:   Resolution (face at each 2mm of the perimeter)
  //cs:   Countersink in both ends.  Countersink style:
  //         -2 - Not even flat ends
  //         -1 - Bottom (countersink'd and top flat)
  //          0 - None (top and bottom flat)
  //          1 - Top (bottom flat)
  //          2 - Both (countersink'd)      
  or=   od/2;                       //outer radius
  ir=   or-sth/2*cos(lf0)/sin(lf0);  
  pf=   2*PI*or;                    //outer circumference
  sn=   floor(pf/rs);
  lfxy= 360/sn;
  ttn=  round(lt/sth+1);
  zt=   sth/sn;

  intersection() {
    if (cs >= -1) {
      thread_shape(cs,lt,or,ir,sn,sth);
    }
    full_thread(ttn,sth,sn,zt,lfxy,or,ir);
  }
}

module screw_lid(cod, wt, tt, hg, sth, lf0, rs) {  //kt added
  //cod:  Outer diameter of the thread to match
  //wt:   outer wall thickness
  //tt:   top wall thickness
  //hg:   the height of the lid
  //sth:  Step height (the half will be used to countersink the ends)
  //lf0:  Degrees (same as used for the screw_thread example)
  //rs:  Resolution, set to small values to minimize overhang issues
  
  //cod2 = df - wt*2;
  df = cod + wt*2;
  chg = sth/2;
  
  difference() {
    round_head(hg,df);
    
    translate([0,0,hg-chg+0.1])  //top countersink
      cylinder(h=chg+0.01, 
               r1=cod/2-(chg+0.1)*cos(lf0)/sin(lf0),
               r2=cod/2, 
               $fn=floor(cod*PI/rs), center=false);
    translate([0,0,tt]) {
      difference() {
        screw_thread(cod, sth, lf0, hg, rs, -2);
        translate([0,0,-5])
          cylinder(d=df,h=5);
      }  
    }  
  }  
}  

module hex_nut(df,hg,sth,lf0,cod,rs) {
  //df:  Distance between flats
  //hg:  Height 
  //sth: Step height (the half will be used to countersink the ends)
  //lf0: Degrees (same as used for the screw_thread example)
  //cod: Outer diameter of the thread to match
  //rs: Resolution, you may want to set this to small values
  //                  (quite high res) to minimize overhang issues
  difference() {
    hex_head(hg,df);
    
    hex_countersink_ends(sth/2,cod,lf0,rs,hg);
    screw_thread(cod,sth,lf0,hg,rs,-2);
  }
}


module round_nut(df,hg,sth,lf0,cod,rs)  {  //kt added
  //df:  Distance between flats
  //hg:  Height 
  //sth: Step height (the half will be used to countersink the ends)
  //lf0: Degrees (same as used for the screw_thread example)
  //cod: Outer diameter of the thread to match
  //rs: Resolution, you may want to set this to small values
  //                  (quite high res) to minimize overhang issues
  difference() {
    round_head(hg,df);
    
    hex_countersink_ends(sth/2,cod,lf0,rs,hg);
    screw_thread(cod,sth,lf0,hg,rs,-2);
  }
}


module hex_screw(od,sth,lf0,lt,rs,cs,df,hg,ntl,ntd) {
  //od :  Outer diameter of the thread
  //sth:  Thread step
  //lf0:  Step shape degrees
  //lt:   Length of the threaded section of the screw
  //rs:   Resolution (face at each 2mm of the perimeter)
  //cs:   Countersink in both ends
  //df:   Distance between flats for the hex head
  //hg:   Height of the hex head (can be zero)
  //ntl:  Length of the non threaded section of the screw (can be zero)
  //ntd:  Diameter for the non threaded section of the screw
  //                    -1 - Same as inner diameter of the thread
  //                     0 - Same as outer diameter of the thread
  //                 value - The given value
  
  ntr=od/2-(sth/2)*cos(lf0)/sin(lf0);

  union() {
    hex_head(hg,df);
    translate([0,0,hg])
    if ( ntl == 0 ) {
      cylinder(h=0.01, r=ntr, center=true);
    } else {
      if ( ntd == -1 ) {
        cylinder(h=ntl+0.01, r=ntr, $fn=floor(od*PI/rs), center=false);
      }
      else if ( ntd == 0 ) {
        union() {
          cylinder(h=ntl-sth/2,
                   r=od/2, $fn=floor(od*PI/rs), center=false);
          translate([0,0,ntl-sth/2])
          cylinder(h=sth/2,
                   r1=od/2, r2=ntr, 
                   $fn=floor(od*PI/rs), center=false);
        }
      } else {
        cylinder(h=ntl, r=ntd/2, $fn=ntd*PI/rs, center=false);
      }
    }
    translate([0,0,ntl+hg]) screw_thread(od,sth,lf0,lt,rs,cs);
  }
}


module thread_shape(cs,lt,or,ir,sn,sth)  {
  //cs:   Countersink in both ends.  Countersink style:
  //         -2 - Not even flat ends
  //         -1 - Bottom (countersink'd and top flat)
  //          0 - None (top and bottom flat)
  //          1 - Top (bottom flat)
  //          2 - Both (countersink'd)      
  //lt:   Length of the threaded section of the screw.  Length (Z) of the tread
  //or:   Outer radius of the thread (od/2 :  Half outer diameter of the thread)
  //ir:   Inner radius of the thread
  //sn:   value for $fn  
  //sth:   Thread step
  
  if ( cs == 0 ) {
    cylinder(h=lt, r=or, $fn=sn, center=false);
  } else {
    union() {
      translate([0,0,sth/2])
        cylinder(h=lt-sth+0.005, r=or, $fn=sn, center=false);

      if ( cs == -1 || cs == 2 ) {
        cylinder(h=sth/2, r1=ir, r2=or, $fn=sn, center=false);
      } else {
        cylinder(h=sth/2, r=or, $fn=sn, center=false);
      }

      translate([0,0,lt-sth/2])
      if ( cs == 1 || cs == 2 ) {
        cylinder(h=sth/2, r1=or, r2=ir, $fn=sn, center=false);
      } else {
        cylinder(h=sth/2, r=or, $fn=sn, center=false);
      }
    }
  }
}

module full_thread(ttn,sth,sn,zt,lfxy,or,ir) {
  
  if (ir >= 0.2) {
    for (i=[0:ttn-1]) {
      for (j=[0:sn-1]) {
        //kt mod 11/21/17 -- removed assign()           
        pt = [[0,                  0,                  i*sth-sth            ],
              [ir*cos(j*lfxy),     ir*sin(j*lfxy),     i*sth+j*zt-sth       ],
              [ir*cos((j+1)*lfxy), ir*sin((j+1)*lfxy), i*sth+(j+1)*zt-sth   ],
              [0,                  0,                  i*sth                ],
              [or*cos(j*lfxy),     or*sin(j*lfxy),     i*sth+j*zt-sth/2     ],
              [or*cos((j+1)*lfxy), or*sin((j+1)*lfxy), i*sth+(j+1)*zt-sth/2 ],
              [ir*cos(j*lfxy),     ir*sin(j*lfxy),     i*sth+j*zt           ],
              [ir*cos((j+1)*lfxy), ir*sin((j+1)*lfxy), i*sth+(j+1)*zt       ],
              [0,                  0,                  i*sth+sth            ]	];
        //kt mod 11/21/17 -- changed 'triangles=' to 'faces=' 
        //   according to compiler warning
        polyhedron(points=pt,
                  faces=[	[1,0,3],[1,3,6],[6,3,8],[1,6,4],
                  [0,1,2],[1,4,2],[2,4,5],[5,4,6],[5,6,7],[7,6,8],
                  [7,8,3],[0,2,3],[3,2,7],[7,2,5]	]);
      }
    }
  } else {
    echo("Step Degrees too aggresive, the thread will not be made!!");
    echo("Try to increase de value for the degrees and/or...");
    echo(" decrease the pitch value and/or...");
    echo(" increase the outer diameter value.");
  }
}

module hex_head(hg,df)  {
  //hg:  Height 
  //df:  Distance between flats
	rd0=df/2/sin(60);
	x0=0;	x1=df/2;	x2=x1+hg/2;
	y0=0;	y1=hg/2;	y2=hg;

	intersection() {
	  cylinder(h=hg, r=rd0, $fn=6, center=false);

		rotate_extrude(convexity=10, $fn=6*round(df*PI/6/0.5))
		polygon([ [x0,y0],[x1,y0],[x2,y1],[x1,y2],[x0,y2] ]);
	}
}

module round_head(hg,df)  {  //kt added
  //hg:  Height 
  //df:  diameter of outside (bevel will begin at radius-1 mm)
  r = df/2;
  l = r + hg-1;
  
  intersection() {
    cylinder(h=hg, r=df/2, $fn=100, center=false);
    cylinder(r1=l, r2=0, h=l, $fn=100);
    translate([0,0,hg])
      rotate([180,0,0])
        cylinder(r1=l, r2=0, h=l, $fn=100);
  }  
}


module hex_countersink_ends(chg, cod, lf0, rs, hg) {
  //chg: Step height/2 (used to countersink the ends)  
  //cod: Outer diameter of the thread to match
  //lf0: Degrees (same as used for the screw_thread example)
  //rs: Resolution, you may want to set this to small values (quite high res) to minimize overhang issues
  //hg:  Height   
  translate([0,0,-0.1])
    cylinder(h=chg+0.01, 
             r1=cod/2, 
             r2=cod/2-(chg+0.1)*cos(lf0)/sin(lf0),
             $fn=floor(cod*PI/rs), center=false);

  translate([0,0,hg-chg+0.1])
    cylinder(h=chg+0.01, 
             r1=cod/2-(chg+0.1)*cos(lf0)/sin(lf0),
             r2=cod/2, 
             $fn=floor(cod*PI/rs), center=false);
}


//======= TESTS / EXAMPLES ==========

if (show_example_1 == 1) {
/* Example 01.
 * Just a 100mm long threaded rod.
 */
  translate([example_display_x_offset* 0,0,0])
    screw_thread(15,   // Outer diameter of the thread
                  4,   // Step, traveling length per turn, also, tooth height, whatever...
                 55,   // Degrees for the shape of the tooth 
                       //   (XY plane = 0, Z = 90, btw, 0 and 90 will/should not work...)
                100,   // Length (Z) of the tread
               PI/2,   // Resolution, one face each "PI/2" mm of the perimeter, 
                  0);  // Countersink style:
                       //     -2 - Not even flat ends
                       //     -1 - Bottom (countersink'd and top flat)
                       //     0 - None (top and bottom flat)
                       //      1 - Top (bottom flat)
                       //      2 - Both (countersink'd)

}

if (show_example_2 == 1) {
  /* Example 02.
   * A nut for the previous example.
   */
  translate([example_display_x_offset* 1,0,0])
    hex_nut(24,  // Distance between flats
              8,  // Height 
              4,  // Step height (the half will be used to countersink the ends)
             55,  // Degrees (same as used for the screw_thread example)
             15,  // Outer diameter of the thread to match
            0.5);  // Resolution, you may want to set this to small values
                  //   (quite high res) to minimize overhang issues
}


if (show_example_3 == 1) {
  /* Example 03.
   * A screw, threaded all the way, with hex head.
   */
  translate([example_display_x_offset* 2,0,0])
    hex_screw(15,  // Outer diameter of the thread
               4,  // Thread step
              55,  // Step shape degrees
              30,  // Length of the threaded section of the screw
             1.5,  // Resolution (face at each 2mm of the perimeter)
               2,  // Countersink in both ends
              24,  // Distance between flats for the hex head
               8,  // Height of the hex head (can be zero)
               0,  // Length of the non threaded section of the screw
               0); // Diameter for the non threaded section of the screw
                   //     -1 - Same as inner diameter of the thread
                   //      0 - Same as outer diameter of the thread
                   //  value - The given value
}

if (show_example_4 == 1) {
  /* Example 04.
   * A screw with a non threaded section and with hex head.
   *
   * Same module and parameters than for Example 03 but for the length of the non- 
   *  threaded section which is set to 50mm here.
   *
   */
  translate([example_display_x_offset* 3,0,0])
    hex_screw(15,  //od :  Outer diameter of the thread
               4,  //sth:  Thread step
              55,  //lf0:  Step shape degrees
              30,  //lt:   Length of the threaded section of the screw
             1.5,  //rs:   Resolution (face at each 2mm of the perimeter)
               2,  //cs:   Countersink in both ends
              24,  //df:   Distance between flats for the hex head
               8,  //hg:   Height of the hex head (can be zero)
              50,  //ntl:  Length of the non threaded section of the screw (can be zero)
               0   //ntd:  Diameter for the non threaded section of the screw
                   //     -1 - Same as inner diameter of the thread
                   //      0 - Same as outer diameter of the thread
                   //  value - The given value
  );
}

if (show_example_5 == 1) {
  /* Example 05.
   *
   * A rod whith a middle section without thread and, a portion of it, hex shaped.
   * One end is threaded in the opposite direction than the other.
   *
   * So... yes, OpenSCAD mirror feature will change the thread direction.
   *
   */
  translate([example_display_x_offset* 4,0,0])  
  translate([0,0,32.5+5+7.5])
  union() {
    hex_screw(15,4,55,32.5,1.5,2,15,5,7.5,0);
    mirror([0,0,1]) {
      hex_screw(15,4,55,32.5,1.5,2,15,5,7.5,0);
    }  
  }
}

if (show_example_6 == 1) {  //kt added
  /* Example 06.
   * A lid for screw a screw jar
   * A screw jar for above lid
   */
  diameter = 30;
  height = 20;
  tolerance = 0.5;
  lid_top_thick = 2;
  
  lf0 = 55;
  rs = 2; //0.5

  if (show_lid ==1) {  
    translate([example_display_x_offset* 0,0,0])  
    screw_lid(diameter,  //cod: Outer diameter of the thread to match
               2,  //wt: wall_thickness. The thickness of the outer walls
               lid_top_thick,  //tt: top thickness
              10,  //hg:  the height of the lid
               4,  //sth: Step height (the half will be used to countersink the ends)
             lf0,  //lf0: Degrees (same as used for the screw_thread example)
              rs   //rs: Resolution -- set small values to minimize overhang issues
    );
  }  
  
  if (show_base) {
    translate([example_display_x_offset* 0,0,0])  
    translate([0,0,height+ lid_top_thick])
    rotate([0,180,0])
    translate([0,0,0])  //25
      hollow_screw_thread(diameter - tolerance*2,   //od:   Outer diameter of the thread
                           2,   //wt:   wall thickness
                           0,   //bt:   base thickness (may be zero)
                           0,   //tt:   top thickness (may be zero)
                           4,   //sth:  Thread step 
                          lf0,   //lf0:  Step shape degrees.  Step, traveling length per turn
                          11,   //lt:   Length of the threaded section of the screw.  Length (Z) of the tread
                      height,   //tl:   Total length of object (tl = lt + unthreaded_length)  
                          rs,   //rs:   Resolution (face at each 2mm of the perimeter)
                           2    //cs:   Countersink in both ends
    );
  }  
  
  
}


