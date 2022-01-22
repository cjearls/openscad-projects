include <../parameters/lightswitch_parameters.scad>
include <../parameters/switch_bracket_parameters.scad>

module switchBracket(numberOfSwitches=numberOfSwitches, plateToEdgeSwitch=plateToEdgeSwitch, switchToSwitch=switchToSwitch, switchHeight=switchHeight, switchWidth=switchWidth, verticalScrewDistance=verticalScrewDistance, plateHeight=plateHeight, plateDepth=plateDepth, screwDiameter=screwDiameter, bracket_thickness = bracket_thickness, bracket_edge_distance = bracket_edge_distance){
    rotate([90, 0, 0]){
        difference(){
            cube([bracket_width, bracket_height, bracket_thickness]);
            // screw hole top
            translate([bracket_width/2, bracket_edge_distance, 0]){
                cylinder(r=screwDiameter/2, h=bracket_thickness);
            }
            // screw hole bottom
            translate([bracket_width/2, bracket_height - bracket_edge_distance, 0]){
                cylinder(r=screwDiameter/2, h=bracket_thickness);
            }
            // switch hole
            translate([(bracket_width - switchWidth)/2, (bracket_height - switchHeight)/2, 0]){
                cube([switchWidth, switchHeight, bracket_thickness]);
            }
        }
    }
}

switchBracket(numberOfSwitches, plateToEdgeSwitch, switchToSwitch, switchHeight, switchWidth, verticalScrewDistance, plateHeight, plateDepth, screwDiameter);