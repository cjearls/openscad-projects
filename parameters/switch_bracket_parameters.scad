include <../parameters/lightswitch_parameters.scad>
include <../parameters/55g_servo_parameters.scad>

bracket_thickness = 3;
bracket_edge_distance = 5;
servo_gear_vertical_offset_from_switch_center = 0;
servo_top_horizontal_offset_from_switch_edge = (gear_height + switchWidth)/2 - 1;
servo_offset_from_switch_plate = 27 + bracket_thickness;

bracket_tolerance_offset = .75;

bracket_height = verticalScrewDistance + 2*bracket_edge_distance;
bracket_width = switchWidth + 2*bracket_edge_distance;

bracket_overhang_extension = 2;

switch_bracket_edge_to_servo_bracket = (total_servo_height - overhang_height) - servo_top_horizontal_offset_from_switch_edge - (bracket_width - switchWidth)/2;