include <../nutsnbolts/cyl_head_bolt.scad>
include <../parameters/desk_clamp_parameters.scad>

module desk_clamp_nut(){
    nut(name=screw_standard_name, thread="modeled");
}

desk_clamp_nut();