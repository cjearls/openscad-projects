include <../parameters/55g_servo_parameters.scad>

screw_shaft_hole_radius = 2.45/2;
screw_head_hole_radius = 5.3/2;
screw_head_hole_depth = 0;
gear_hole_depth_offset = .3;
screw_gear_hole_depth = gear_height - gear_hole_depth_offset;

attachment_thickness = 6;
attachment_length = 38;
attachment_width = 8;
attachment_angle = 75;
attachment_open_angle = 40;
fn_value = 20;
rotated_extrusion_thickness = 3;
// These parameters affect the teeth that mesh with the servo's gear
teeth_diameter = 4.912;
tooth_length = .198;
number_of_teeth = 21;

teeth_diameter = 5.89;
tooth_length = .3;
number_of_teeth = 26;
// This scales the teeth to factor in imperfections in the printing resolution
// Testing 1, 1.05, 1.1, and 1.15.
teeth_scaling_factor = 1.15;

attachment_arc_angle = (attachment_angle - attachment_open_angle)/2;
hole_centers_offset_from_edge = attachment_width/2;