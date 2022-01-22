use <../modules/lightswitch.scad>
use <../modules/lightswitch_plate.scad>
use <../modules/9g_servo.scad>
use <../modules/switch_bracket.scad>
use <../assemblies/lightswitch_assembly.scad>

include <../parameters/lightswitch_parameters.scad>
include <../parameters/9g_servo_parameters.scad>
include <../parameters/switch_bracket_parameters.scad>

$fn=20;

// This helps to make a smooth animation for the switch full model.
render(){
  switchPosition = 0;
  translate([0, 0, plateHeight/2 + gearbox_major_radius]){
    rotate([-90, 90, -90]){
      color([1, 0, 0]){
        9g_servo();
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