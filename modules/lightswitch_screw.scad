include <../parameters/lightswitch_parameters.scad>

module lightswitch_screw(screwLength = screwLength, screwHeadRadius = screwHeadRadius, screwHeadHeight = screwHeadHeight, screwBodyRadius = screwBodyRadius){
    union(){
        cylinder(h=screwLength, r=screwBodyRadius);
        cylinder(h=screwHeadHeight, r=screwHeadRadius);
    }
}

lightswitch_screw(numberOfSwitches, plateToEdgeSwitch, switchToSwitch, switchHeight, switchWidth, verticalScrewDistance, plateHeight, plateDepth, screwDiameter);