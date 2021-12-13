// This is a light switch plate parameterized on how many light switches the plate has.
numberOfSwitches = 3;

// These parameters shouldn't change, but are the measurements in inches of the various lengths on a standard light switch.
plateToEdgeSwitchInches = 1.375;
switchToSwitchInches = 1.875;
switchHeightInches = 1;
switchWidthInches = 3/8;
verticalScrewDistanceInches = 2.375;
plateHeightInches = 4.5;
screwDiameterInches = 3/16;

// These are the parameters converted into the metric units used by OpenSCAD
inchesToMm = 25.4;
plateToEdgeSwitch = plateToEdgeSwitchInches * inchesToMm;
switchToSwitch = switchToSwitchInches * inchesToMm;
switchHeight = switchHeightInches * inchesToMm;
switchWidth = switchWidthInches * inchesToMm;
verticalScrewDistance = verticalScrewDistanceInches * inchesToMm;
plateHeight = plateHeightInches * inchesToMm;
screwDiameter = screwDiameterInches * inchesToMm;

// Undefined parameters that I'm guessing at
plateDepth = 1;

module switchPlate(numberOfSwitches, plateToEdgeSwitch, switchToSwitch, switchHeight, switchWidth, verticalScrewDistance, plateHeight, plateDepth, screwDiameter){
    screwVerticalDistanceFromEdge = (plateHeight-verticalScrewDistance)/2;

    difference(){
        cube([plateToEdgeSwitch*2+(switchToSwitch*(numberOfSwitches-1)), plateHeight, plateDepth]);
        for(index = [0:1:numberOfSwitches-1]){
            // screw hole top
            translate([plateToEdgeSwitch + (index * switchToSwitch) - screwDiameter/2, screwVerticalDistanceFromEdge - screwDiameter/2, 0]){
                cylinder(r1=screwDiameter/2, r2=screwDiameter/2, h=plateDepth);
            }
            // screw hole bottom
            translate([plateToEdgeSwitch + (index * switchToSwitch) - screwDiameter/2, plateHeight-screwVerticalDistanceFromEdge - screwDiameter/2, 0]){
                cylinder(r1=screwDiameter/2, r2=screwDiameter/2, h=plateDepth);
            }
            // switch hole
            translate([plateToEdgeSwitch + (index * switchToSwitch) - switchWidth/2, plateHeight/2 - switchHeight/2, 0]){
                cube([switchWidth, switchHeight, plateDepth]);
            }
        }
    }
}

switchPlate(numberOfSwitches, plateToEdgeSwitch, switchToSwitch, switchHeight, switchWidth, verticalScrewDistance, plateHeight, plateDepth, screwDiameter);