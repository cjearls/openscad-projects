include <../parameters/raspberry_pi_3b_parameters.scad> 

$fn = 12;
case_thickness = 1;
pins_from_case_vertical_offset = 1;
raspberry_pi_offset = [2.5, 2.5, case_thickness + pin_penetration_distance + pins_from_case_vertical_offset];
hole_radius_offset = 0.2;