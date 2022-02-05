include <../parameters/desk_clamp_parameters.scad>

use <../modules/desk_clamp.scad>
use <../modules/desk_clamp_nut.scad>
use <../modules/desk_clamp_screw.scad>
use <../modules/desk_clamp_threaded_slot.scad>

$fn=60;

// This represents the area of desk we can attach to
translate([0, 0, -desk_depth]) cube([desk_width, 50, desk_depth]);
// This represents the wall
translate([-wall_distance_from_desk_edge + 1, -100, -100]) cube([1, 200, 200]);

desk_clamp();
translate([desk_clamp_hole_distance_from_edge, desk_clamp_width/2, -desk_clamp_total_gap_height - screw_head_height - desk_depth]) mirror([0, 0, 1]) desk_clamp_screw();
translate([desk_clamp_below_length + desk_clamp_threaded_slot_tolerance_offset, desk_clamp_width, -desk_clamp_total_gap_height + desk_clamp_thickness + desk_clamp_threaded_slot_tolerance_offset]) rotate([0, 0, 180]) desk_clamp_threaded_slot();
translate([0, -30, 0]) desk_clamp_nut();