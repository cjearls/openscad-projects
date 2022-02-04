include <../parameters/desk_clamp_parameters.scad>
include <../nutsnbolts/cyl_head_bolt.scad>

module desk_clamp(){
  difference(){
    union(){
      cube([desk_clamp_above_length, desk_clamp_width, desk_clamp_thickness]);
      translate([-desk_clamp_thickness, 0, -desk_clamp_total_gap_height]) cube([desk_clamp_thickness, desk_clamp_width, desk_clamp_total_gap_height + desk_clamp_thickness]);
      translate([0, 0, -desk_clamp_total_gap_height]) cube([desk_clamp_below_length, desk_clamp_width, desk_clamp_thickness]);
    }
    translate([desk_clamp_hole_distance_from_edge, desk_clamp_width/2, -desk_clamp_total_gap_height + desk_clamp_thickness]) hole_threaded(name=screw_standard_name, l=desk_clamp_thickness, cltd=desk_clamp_hole_diameter_clearance, thread="no");
  }
}

desk_clamp();