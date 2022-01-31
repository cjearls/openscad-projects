include <../parameters/9g_servo_parameters.scad>

screw_shaft_hole_radius = 2.45/2;
screw_head_hole_radius = 4.75/2;
screw_head_hole_depth = 0.9;
screw_gear_hole_depth = 1.9;
gear_radius_offset = .15;

largest_hole_offset_from_edge = 1;
attachment_thickness = 5;
attachment_length = 30;
attachment_width = 6;
fn_value = 20;

screw_gear_hole_radius = gear_radius + gear_radius_offset;
hole_centers_offset_from_edge = largest_hole_offset_from_edge + max(screw_shaft_hole_radius, screw_head_hole_radius, screw_gear_hole_radius);