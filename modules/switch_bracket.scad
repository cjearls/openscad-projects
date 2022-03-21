include <../parameters/lightswitch_parameters.scad>
include <../parameters/switch_bracket_parameters.scad>

module switchBracket(numberOfSwitches=numberOfSwitches, plateToEdgeSwitch=plateToEdgeSwitch, switchToSwitch=switchToSwitch, switchHeight=switchHeight, switchWidth=switchWidth, verticalScrewDistance=verticalScrewDistance, plateHeight=plateHeight, plateDepth=plateDepth, screwDiameter=screwDiameter, bracket_thickness = bracket_thickness, bracket_edge_distance = bracket_edge_distance, servo_gear_vertical_offset_from_switch_center = servo_gear_vertical_offset_from_switch_center, servo_horizontal_offset_from_switch = servo_horizontal_offset_from_switch, servo_offset_from_switch_plate = servo_offset_from_switch_plate){
    $fn=20;
    // Light switch bracket
    rotate([90, 0, 0]){
        union(){
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
            translate([bracket_width/2 - gear_height/2 - total_gearbox_height - (servo_body_dimensions[2] - overhang_height - overhang_dimensions[2]) - (servo_horizontal_offset_from_switch + (switchWidth + gear_height)/2), servo_gear_vertical_offset_from_switch_center + bracket_height/2 + gearbox_radii[0] - (servo_body_dimensions[0] + overhang_extension), bracket_thickness-servo_offset_from_switch_plate]){
                cube([bracket_thickness + (servo_horizontal_offset_from_switch + total_gearbox_height), overhang_dimensions[0], servo_offset_from_switch_plate]);
            }
        }
    }

    // Servo bracket
    translate([bracket_edge_distance - total_gearbox_height - gear_height - (servo_body_dimensions[2] - overhang_dimensions[2] - overhang_height) - servo_horizontal_offset_from_switch, servo_offset_from_switch_plate - bracket_thickness, servo_gear_vertical_offset_from_switch_center + overhang_dimensions[0] + bracket_height/2 + gearbox_radii[0] - (servo_body_dimensions[0] + overhang_extension)]){
        rotate([0, 90, 0]){
            difference(){
                cube([overhang_dimensions[0], overhang_dimensions[1], bracket_thickness]);
                translate([overhang_extension - bracket_tolerance_offset, 0, 0]){
                    cube([servo_body_dimensions[0] + 2*bracket_tolerance_offset, servo_body_dimensions[1], servo_body_dimensions[2]]);
                }

                // Mounting holes
                translate([overhang_hole_lengthwise_offset, overhang_hole_widthwise_offset, 0]){
                    cylinder(r=overhang_hole_radius, h=bracket_thickness);
                }
                translate([overhang_hole_lengthwise_offset, overhang_dimensions[1] - overhang_hole_widthwise_offset, 0]){
                    cylinder(r=overhang_hole_radius, h=bracket_thickness);
                }
                translate([overhang_dimensions[0] - overhang_hole_lengthwise_offset, overhang_hole_widthwise_offset, 0]){
                    cylinder(r=overhang_hole_radius, h=bracket_thickness);
                }
                translate([overhang_dimensions[0] - overhang_hole_lengthwise_offset, overhang_dimensions[1] - overhang_hole_widthwise_offset, 0]){
                    cylinder(r=overhang_hole_radius, h=bracket_thickness);
                }
            }
        }
    }
}

switchBracket(numberOfSwitches, plateToEdgeSwitch, switchToSwitch, switchHeight, switchWidth, verticalScrewDistance, plateHeight, plateDepth, screwDiameter);