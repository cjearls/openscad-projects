include <../parameters/9g_servo_parameters.scad>

screw_shaft_hole_radius = 2.45/2;
screw_head_hole_radius = 5.3/2;
screw_head_hole_depth = 0;
gear_radius_offset = .15;
gear_hole_depth_offset = .3;
screw_gear_hole_depth = gear_height - gear_hole_depth_offset;

attachment_thickness = 8;
attachment_length = 38;
attachment_width = 6;
attachment_angle = 75;
attachment_open_angle = 40;
fn_value = 20;
rotated_extrusion_thickness = 3;

attachment_arc_angle = (attachment_angle - attachment_open_angle)/2;
screw_gear_hole_radius = gear_radius + gear_radius_offset;
hole_centers_offset_from_edge = attachment_width/2;