;FLAVOR:Marlin
;TIME:236
;Filament used: 0.155498m
;Layer height: 0.2
;MINX:1.2
;MINY:1.2
;MINZ:0.2
;MAXX:306.8
;MAXY:280.8
;MAXZ:0.4
;Generated with Cura_SteamEngine master
M140 S50
M105
M190 S50
M104 S200
M105
M109 S200
M82 ;absolute extrusion mode
M201 X500.00 Y500.00 Z100.00 E5000.00 ;Setup machine max acceleration
M203 X500.00 Y500.00 Z10.00 E50.00 ;Setup machine max feedrate
M204 P500.00 R1000.00 T500.00 ;Setup Print/Retract/Travel acceleration
M205 X8.00 Y8.00 Z0.40 E5.00 ;Setup Jerk
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate

G28 ;Home

G92 E0 ;Reset Extruder
G1 Z2.0 F3000 ;Move Z Axis up
G1 X10.1 Y20 Z0.28 F5000.0 ;Move to start position
G1 X10.1 Y200.0 Z0.28 F1500.0 E15 ;Draw the first line
G1 X10.4 Y200.0 Z0.28 F5000.0 ;Move to side a little
G1 X10.4 Y20 Z0.28 F1500.0 E30 ;Draw the second line
G92 E0 ;Reset Extruder
G1 Z2.0 F3000 ;Move Z Axis up

G92 E0
G92 E0
G1 F2700 E-5
;LAYER_COUNT:2
;LAYER:0
M107
;MESH:dimension_test.stl
G0 F6000 X1.6 Y280.4 Z0.2
;TYPE:WALL-OUTER
G1 F2700 E0
G1 F1200 X306.4 Y280.4 E10.13769
G1 X306.4 Y1.6 E19.41061
G1 X1.6 Y1.6 E29.5483
G1 X1.6 Y280.4 E38.82123
G1 F2700 E33.82123
G0 F6000 X1.4 Y280.4
G0 X1.457 Y280.503
G0 X306.63 Y280.63
G0 X306.8 Y280.8
G1 F2700 E38.82123
G1 F1200 X1.2 Y280.8 E48.98553
G1 X1.2 Y1.2 E58.28506
G1 X306.8 Y1.2 E68.44936
G1 X306.8 Y280.8 E77.74889
G1 F2700 E72.74889
;MESH:NONMESH
G0 F300 X306.8 Y280.8 Z0.4
G0 F6000 X306.63 Y280.63
G0 X1.472 Y280.528
G0 X1.4 Y280.4
G0 X1.6 Y280.4
;TIME_ELAPSED:129.460846
;LAYER:1
M106 S85
;TYPE:WALL-OUTER
;MESH:dimension_test.stl
G1 F2700 E77.74889
G1 F1350 X306.4 Y280.4 E87.88658
G1 X306.4 Y1.6 E97.15951
G1 X1.6 Y1.6 E107.2972
G1 X1.6 Y280.4 E116.57012
G1 F2700 E111.57012
G0 F7500 X1.4 Y280.4
G0 X1.457 Y280.503
G0 X306.63 Y280.63
G0 X306.8 Y280.8
G1 F2700 E116.57012
G1 F1350 X1.2 Y280.8 E126.73442
G1 X1.2 Y1.2 E136.03395
G1 X306.8 Y1.2 E146.19825
G1 X306.8 Y280.8 E155.49778
;TIME_ELAPSED:236.811802
G1 F2700 E150.49778
M140 S0
M107
G91 ;Relative positioning
G1 E-2 F2700 ;Retract a bit
G1 E-2 Z0.2 F2400 ;Retract and raise Z
G1 X5 Y5 F3000 ;Wipe out
G1 Z10 ;Raise Z more
G90 ;Absolute positionning

G1 X0 Y282 ;Present print
M106 S0 ;Turn-off fan
M104 S0 ;Turn-off hotend
M140 S0 ;Turn-off bed

M84 X Y E ;Disable all steppers but Z

M82 ;absolute extrusion mode
M104 S0
;End of Gcode
;SETTING_3 {"global_quality": "[general]\\nversion = 4\\nname = Standard Quality
;SETTING_3  #2\\ndefinition = creality_cr10s\\n\\n[metadata]\\ntype = quality_ch
;SETTING_3 anges\\nquality_type = standard\\nsetting_version = 15\\n\\n[values]\
;SETTING_3 \nadhesion_type = none\\nsupport_enable = False\\n\\n", "extruder_qua
;SETTING_3 lity": ["[general]\\nversion = 4\\nname = Standard Quality #2\\ndefin
;SETTING_3 ition = creality_cr10s\\n\\n[metadata]\\ntype = quality_changes\\nqua
;SETTING_3 lity_type = standard\\nintent_category = default\\nposition = 0\\nset
;SETTING_3 ting_version = 15\\n\\n[values]\\ninfill_sparse_density = 20\\n\\n"]}
