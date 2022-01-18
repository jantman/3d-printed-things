use <Parametric_Pegboard_Base.scad>;
// For my pegboard, I want to override the following defaults:
// peg_clearance (how far undersized the pegs should be) defaults to 0.25, let's make it 0.5
// peg_height (how thick is the pegboard) defaults to 3.175, but my board is more like 5 or 5.5mm
// peg_angle defaults to 60; trying to fit those in snaps them right off
// IMPORTANT: depth is set to 2 just to provide a quicker print for testing
pegboard_base(2, 2, clearance=0.5, height=2.5, angle=45, depth=2);
