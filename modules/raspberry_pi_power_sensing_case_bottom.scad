include <../parameters/raspberry_pi_power_sensing_case_parameters.scad>
include <../nutsnbolts/cyl_head_bolt.scad>
use <../openscad-rpi-library/misc_boards.scad>

module raspberry_pi_power_sensing_case_bottom(){
  difference(){
    union(){
      cube([base_case_dimensions[0], base_case_dimensions[1], case_thickness]);
      for (hole = mounting_holes){
        translate(hole + [raspberry_pi_offset[0], raspberry_pi_offset[1], case_thickness]){
          difference(){
            union(){
              cylinder(r = hole_radius_insert, h = hole_insert_height);
              cylinder(r = hole_support_radius, h = hole_support_height);
            }
            translate([0, 0, hole_insert_height]) hole_threaded(name = thread_standard_name, l = hole_insert_height, thread="modeled");
          }
        }
      }
      cube([case_thickness, base_case_dimensions[1], base_case_dimensions[2]]);
      translate([0, base_case_dimensions[1] - case_thickness, 0]) cube([base_case_dimensions[0], case_thickness, base_case_dimensions[2]]);
      translate([base_case_dimensions[0] - case_thickness, 0, 0]) cube([case_thickness, base_case_dimensions[1], base_case_dimensions[2]]);
    }

    // Raspberry Pi Cutouts
    translate(usb_cutout_offset + raspberry_pi_offset) cube(usb_cutout_dimensions);
    translate(power_cutout_offset + raspberry_pi_offset) cube(power_cutout_dimensions);
    translate(hdmi_cutout_offset + raspberry_pi_offset) cube(hdmi_cutout_dimensions);
    translate(audio_cutout_offset + raspberry_pi_offset) cube(audio_cutout_dimensions);
  }
}

raspberry_pi_power_sensing_case_bottom();