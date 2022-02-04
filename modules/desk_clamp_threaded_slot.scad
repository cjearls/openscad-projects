include <../parameters/desk_clamp_parameters.scad>
include <../nutsnbolts/cyl_head_bolt.scad>

module desk_clamp_threaded_slot(){

    nut(name=screw_standard_name, thread="modeled");
}

desk_clamp_threaded_slot();
