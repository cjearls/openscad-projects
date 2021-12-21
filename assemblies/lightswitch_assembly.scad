// The "use" keyword means only functions and modules are taken.
use <../modules/lightswitch.scad>
use <../modules/lightswitch_plate.scad>
// The "include" keyword means all variables are taken as though the code was inserted in this file.
include <../parameters/lightswitch_parameters.scad>

// The list of switchRotations is a list of numbers from -1 to 1 that controls the rotation of each switch in the switch model
module switchFullModel(switchRotations = [for (i = [0:numberOfSwitches-1]) 0]){
    switchPlate();
    for(index=[0:1:numberOfSwitches-1]){
        translate([plateToEdgeSwitch + (index*switchToSwitch), -switchDepth, plateHeight/2]){
            rotate([0, switchRotations[index]*switchRotationMultiplier, 90]){
                    switch();
            }
        }
    }
}

// This helps to make a smooth animation for the switch full model.

switchPosition = 0;
if ($t < 0.5){
    switchPosition = 1-$t*4;
    switchFullModel(switchRotations = [for (i=[0:numberOfSwitches-1]) switchPosition]);
} else {
    switchPosition = -1+($t-.5)*4;
    switchFullModel(switchRotations = [for (i=[0:numberOfSwitches-1]) switchPosition]);
}