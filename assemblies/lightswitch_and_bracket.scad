use <../modules/lightswitch.scad>
use <../modules/lightswitch_plate.scad>
use <../modules/55g_servo.scad>
use <../modules/switch_bracket.scad>
use <../modules/servo_flipping_attachment.scad>
use <../assemblies/lightswitch_assembly.scad>

include <../parameters/lightswitch_parameters.scad>
include <../parameters/55g_servo_parameters.scad>
include <../parameters/servo_flipping_attachment_parameters.scad>
include <../parameters/switch_bracket_parameters.scad>

$fn=20;

// This helps to make a smooth animation for the switch full model.
render(){
  switchPosition = 0;
  translate([plateToEdgeSwitch - switchWidth/2 - (bracket_width-switchWidth)/2 - switch_bracket_edge_to_servo_bracket - (overhang_height), servo_offset_from_switch_plate, servo_gear_vertical_offset_from_switch_center + (plateHeight/2 + gearbox_radii[0])]){
    rotate([-90, 90, -90]){
      55g_servo();
      if ($t < 0.5){
        translate([gearbox_radii[0], gearbox_radii[0], total_servo_height + attachment_thickness - screw_gear_hole_depth]){
          rotate([0, 0, -118-($t*74)])
          mirror([0, 0, 1]) servo_flipping_attachment();
        }
      } else {
        translate([gearbox_radii[0], gearbox_radii[0], total_servo_height + attachment_thickness - screw_gear_hole_depth]){
          rotate([0, 0, -155+(($t-.5)*74)])
          mirror([0, 0, 1]) servo_flipping_attachment();
        }
      }
    }
  }
 
  translate([plateToEdgeSwitch-bracket_width/2, bracket_thickness, screwVerticalDistanceFromEdge - bracket_edge_distance])
  switchBracket();

  if ($t < 0.5){
      switchPosition = 1-$t*4;
      switchFullModel(switchRotations = [for (i=[0:numberOfSwitches-1]) switchPosition], screwOffset=bracket_thickness);
  } else {
      switchPosition = -1+($t-.5)*4;
      switchFullModel(switchRotations = [for (i=[0:numberOfSwitches-1]) switchPosition], screwOffset=bracket_thickness);
  }
}