include <../parameters/raspberry_pi_3b_parameters.scad> 

$fn = 12;
case_thickness = 1;
pcb_distance_from_case_walls = 2;
case_dimensions = [pcb_dimensions[0] + 2*pcb_distance_from_case_walls + 2*case_thickness, pcb_dimensions[1] + 2*pcb_distance_from_case_walls + 2*case_thickness, 30];
pins_from_case_vertical_offset = 1;
raspberry_pi_offset = [pcb_distance_from_case_walls + case_thickness, pcb_distance_from_case_walls + case_thickness, case_thickness + pin_penetration_distance + pins_from_case_vertical_offset];
hole_radius_offset = 0.2;