include <../parameters/lightswitch_parameters.scad>
include <../parameters/switch_bracket_parameters.scad>

module switchBracket(numberOfSwitches=numberOfSwitches, plateToEdgeSwitch=plateToEdgeSwitch, switchToSwitch=switchToSwitch, switchHeight=switchHeight, switchWidth=switchWidth, verticalScrewDistance=verticalScrewDistance, plateHeight=plateHeight, plateDepth=plateDepth, screwDiameter=screwDiameter, bracket_thickness = bracket_thickness, bracket_edge_distance = bracket_edge_distance, servo_gear_vertical_offset_from_switch_center = servo_gear_vertical_offset_from_switch_center, servo_horizontal_offset_from_switch = servo_horizontal_offset_from_switch, servo_offset_from_switch_plate = servo_offset_from_switch_plate){
    // Light switch bracket
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

    // Servo bracket
    translate([bracket_edge_distance - gearbox_height - gear_height - (servo_body_dimensions[2] - overhang_dimensions[2] - overhang_height) - servo_horizontal_offset_from_switch, servo_offset_from_switch_plate - bracket_thickness, servo_gear_vertical_offset_from_switch_center + overhang_dimensions[0] + bracket_height/2 + gearbox_major_radius - (servo_body_dimensions[0] + overhang_extension)]){
        rotate([0, 90, 0]){
            difference(){
                cube([overhang_dimensions[0], overhang_dimensions[1], bracket_thickness]);
                translate([overhang_extension, 0, 0])
                cube(servo_body_dimensions);
            }
        }
    }
}

switchBracket(numberOfSwitches, plateToEdgeSwitch, switchToSwitch, switchHeight, switchWidth, verticalScrewDistance, plateHeight, plateDepth, screwDiameter);