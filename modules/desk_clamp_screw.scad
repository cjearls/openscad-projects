include <../parameters/desk_clamp_parameters.scad>
include <../nutsnbolts/cyl_head_bolt.scad>

module desk_clamp_screw(){
    union(){
      translate([0, 0, -screw_head_height/2]) hexaprism(ri=screw_head_radius, h=screw_head_height);
      scale([screw_tolerance_scaling_factor, screw_tolerance_scaling_factor, 1]){
        translate([0, 0, -screw_head_height]) hole_threaded(name=screw_standard_name, l=screw_shaft_length, thread="modeled");
      }
    }

}

desk_clamp_screw();
