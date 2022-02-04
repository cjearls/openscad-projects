include <../parameters/desk_clamp_parameters.scad>
include <../nutsnbolts/cyl_head_bolt.scad>

module desk_clamp_threaded_slot(){
    difference(){
        union(){
            cube([desk_clamp_threaded_slot_length, desk_clamp_threaded_slot_width, desk_clamp_threaded_slot_thickness]);
            translate([-desk_clamp_threaded_slot_thickness, 0, -desk_clamp_threaded_slot_total_height + desk_clamp_threaded_slot_thickness]) cube([desk_clamp_threaded_slot_thickness, desk_clamp_threaded_slot_width, desk_clamp_threaded_slot_total_height]);
            translate([0, 0, -desk_clamp_threaded_slot_total_height + desk_clamp_threaded_slot_thickness]) cube([desk_clamp_threaded_slot_length, desk_clamp_threaded_slot_width, desk_clamp_threaded_slot_thickness]);
        }
        translate([desk_clamp_threaded_slot_hole_distance_from_edge, desk_clamp_threaded_slot_width/2, desk_clamp_threaded_slot_thickness]) hole_threaded(name=screw_standard_name, l=desk_clamp_threaded_slot_total_height, thread="modeled");
    }
}

desk_clamp_threaded_slot();
