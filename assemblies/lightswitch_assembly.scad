// The "use" keyword means only functions and modules are taken.
use <../modules/lightswitch.scad>
use <../modules/lightswitch_plate.scad>
// The "include" keyword means all variables are taken as though the code was inserted in this file.
include <../parameters/lightswitch_parameters.scad>

module switchFullModel(){
    switchPlate();
    for(index=[0:1:numberOfSwitches-1]){
        translate([plateToEdgeSwitch + (index*switchToSwitch), -switchDepth, plateHeight/2]){
            rotate([0, 0, 90]){
                    switch();
            }
        }
    }
}

switchFullModel();