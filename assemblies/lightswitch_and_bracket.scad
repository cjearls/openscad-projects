use <../modules/lightswitch.scad>
use <../modules/lightswitch_plate.scad>
use <../modules/9g_servo.scad>
use <../assemblies/lightswitch_assembly.scad>

include <../parameters/lightswitch_parameters.scad>

// This helps to make a smooth animation for the switch full model.
render(){
  switchPosition = 0;
  translate([-10, 0, 50]){
    rotate([-90, 90, -90]){
      9g_servo();
    }
  }
  if ($t < 0.5){
      switchPosition = 1-$t*4;
      switchFullModel(switchRotations = [for (i=[0:numberOfSwitches-1]) switchPosition]);
  } else {
      switchPosition = -1+($t-.5)*4;
      switchFullModel(switchRotations = [for (i=[0:numberOfSwitches-1]) switchPosition]);
  }

  translate([0, 20, 0]){
    9g_motor();
  }
}