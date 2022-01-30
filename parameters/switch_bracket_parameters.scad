include <../parameters/lightswitch_parameters.scad>
include <../parameters/9g_servo_parameters.scad>

bracket_thickness = 3;
bracket_edge_distance = 5;
servo_gear_vertical_offset_from_switch_center = 0;
servo_horizontal_offset_from_switch = -(switchWidth + gear_height)/2;
servo_offset_from_switch_plate = 20 + bracket_thickness;

bracket_height = verticalScrewDistance + 2*bracket_edge_distance;
bracket_width = switchWidth + 2*bracket_edge_distance;
