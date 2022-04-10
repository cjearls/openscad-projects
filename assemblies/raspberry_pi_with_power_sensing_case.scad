use <../openscad-rpi-library/misc_boards.scad>
use <../modules/raspberry_pi_power_sensing_case_bottom.scad>
use <../modules/desk_clamp_screw.scad>
include <../parameters/raspberry_pi_power_sensing_case_parameters.scad>
include <../nutsnbolts/cyl_head_bolt.scad>

translate(raspberry_pi_offset) board_raspberrypi_3_model_b();
for (hole = mounting_holes){
  translate(hole + [raspberry_pi_offset[0], raspberry_pi_offset[1], hole_insert_height + case_thickness + screw_head_height]){
    scale([screw_tolerance_scaling_factor, screw_tolerance_scaling_factor, 1]) desk_clamp_screw(screw_head_height = screw_head_height, screw_head_radius = screw_head_radius, screw_standard_name = thread_standard_name, screw_shaft_length = hole_insert_height);
  }
}

raspberry_pi_power_sensing_case_bottom();