include <../parameters/desk_clamp_parameters.scad>
include <../parameters/desk_clamp_for_cables_parameters.scad>

use <../modules/desk_clamp.scad>

// This is an addition to the generic desk clamp to allow it to manage cables.
module desk_clamp_for_cables(){
    union(){
        desk_clamp();
        cable_holder_exterior_length = cable_holder_interior_length + desk_clamp_thickness;
        cable_holder_exterior_height = cable_holder_interior_height + 2*desk_clamp_thickness;
        translate([-cable_holder_exterior_length, 0, -cable_holder_exterior_height + desk_clamp_thickness]){
            difference(){
                cube([cable_holder_exterior_length, desk_clamp_width, cable_holder_exterior_height]);
                // interior cutout
                translate([desk_clamp_thickness, 0, desk_clamp_thickness]){
                    cube([cable_holder_interior_length, desk_clamp_width, cable_holder_interior_height]);
                }
                // insert slot cutout
                translate([0, 0, cable_holder_exterior_height - cable_holder_insert_slot_height - desk_clamp_thickness]){
                    cube([desk_clamp_thickness, desk_clamp_width, cable_holder_insert_slot_height]);
                }
            }
        }
    }
}

desk_clamp_for_cables();