include <../parameters/lightswitch_parameters.scad>

module switchPlate(numberOfSwitches=numberOfSwitches, plateToEdgeSwitch=plateToEdgeSwitch, switchToSwitch=switchToSwitch, switchHeight=switchHeight, switchWidth=switchWidth, verticalScrewDistance=verticalScrewDistance, plateHeight=plateHeight, plateDepth=plateDepth, screwDiameter=screwDiameter){
    screwVerticalDistanceFromEdge = (plateHeight-verticalScrewDistance)/2;

    rotate([90, 0, 0]){
        difference(){
            cube([plateToEdgeSwitch*2+(switchToSwitch*(numberOfSwitches-1)), plateHeight, plateDepth]);
            for(index = [0:1:numberOfSwitches-1]){
                // screw hole top
                translate([plateToEdgeSwitch + (index * switchToSwitch), screwVerticalDistanceFromEdge, 0]){
                    cylinder(r1=screwDiameter/2, r2=screwDiameter/2, h=plateDepth);
                }
                // screw hole bottom
                translate([plateToEdgeSwitch + (index * switchToSwitch), plateHeight-screwVerticalDistanceFromEdge, 0]){
                    cylinder(r1=screwDiameter/2, r2=screwDiameter/2, h=plateDepth);
                }
                // switch hole
                translate([plateToEdgeSwitch + (index * switchToSwitch) - switchWidth/2, plateHeight/2 - switchHeight/2, 0]){
                    cube([switchWidth, switchHeight, plateDepth]);
                }
            }
        }
    }
}

switchPlate(numberOfSwitches, plateToEdgeSwitch, switchToSwitch, switchHeight, switchWidth, verticalScrewDistance, plateHeight, plateDepth, screwDiameter);