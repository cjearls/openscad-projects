use <../openscad-rpi-library/misc_boards.scad>
use <../modules/raspberry_pi_power_sensing_case_bottom.scad>
include <../parameters/raspberry_pi_power_sensing_case_parameters.scad>
intersection(){
translate(raspberry_pi_offset) board_raspberrypi_3_model_b();

raspberry_pi_power_sensing_case_bottom();
}