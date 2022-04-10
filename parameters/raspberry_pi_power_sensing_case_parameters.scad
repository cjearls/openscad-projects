include <../parameters/raspberry_pi_3b_parameters.scad> 

$fn = 12;
case_thickness = 1;
pcb_distance_from_case_walls = [2, 3, 1.5];
base_case_dimensions = [pcb_dimensions[0] + pcb_distance_from_case_walls[0] + pcb_distance_from_case_walls[2] + 2*case_thickness, pcb_dimensions[1] + pcb_distance_from_case_walls[1] + 2*case_thickness, 30];
pins_from_case_vertical_offset = 1;
raspberry_pi_offset = [pcb_distance_from_case_walls[0] + case_thickness, pcb_distance_from_case_walls[1] + case_thickness, case_thickness + pin_penetration_distance + pins_from_case_vertical_offset];
hole_radius_offset = 0.2;
hole_radius_insert = mounting_hole_radius - hole_radius_offset;
hole_insert_height = raspberry_pi_offset[2] + pcb_dimensions[2] - case_thickness;
hole_support_radius = (hole_radius_insert)*2;
hole_support_height = raspberry_pi_offset[2] - case_thickness;
thread_standard_name = "M2";
screw_tolerance_scaling_factor = .9;
screw_head_height = 1;
screw_head_radius = 2;
usb_cutout_dimensions = [53, 2, 18];
usb_cutout_offset = [1.5, pcb_dimensions[1], .5];
power_cutout_dimensions = [5, 12, 5];
power_cutout_offset = [pcb_dimensions[0], 4.5, 0];