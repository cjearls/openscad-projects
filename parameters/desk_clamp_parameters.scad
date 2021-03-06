// These are used in the assembly to show how the physical layout will look.
desk_depth = 18.2;
desk_width = 16;
desk_support_height = 30;
desk_support_width = 30;
wall_distance_from_desk_edge = 75;

// The screw standard doesn't make bolts with a hex head, which are easier to screw, so these are the dimensions for my own modified screws
screw_standard_name = "M8";
screw_head_height = 6.8;
screw_head_radius = 13/2;
// This scales the screw down in the x and y directions so it screws into the nut effectively
desk_clamp_thickness = 7;
desk_clamp_above_length = 25;
desk_clamp_width = 15;
desk_clamp_total_gap_height = 60;
desk_clamp_hole_distance_from_edge = 60;
desk_clamp_hole_distance_from_clamp_end = 10;
desk_clamp_below_length = desk_clamp_hole_distance_from_edge + desk_clamp_hole_distance_from_clamp_end;
desk_clamp_hole_diameter_clearance = 3;

desk_clamp_threaded_slot_tolerance_offset = 0.5;
desk_clamp_threaded_slot_thickness = desk_clamp_thickness;
desk_clamp_threaded_slot_hole_distance_from_edge = desk_clamp_hole_distance_from_clamp_end + desk_clamp_threaded_slot_tolerance_offset;
desk_clamp_threaded_slot_length = desk_clamp_threaded_slot_hole_distance_from_edge*2;
desk_clamp_threaded_slot_width = desk_clamp_width;
desk_clamp_threaded_slot_total_height = desk_clamp_thickness + 2*desk_clamp_threaded_slot_thickness + 2*desk_clamp_threaded_slot_tolerance_offset;

screw_tolerance_scaling_factor = .9;
screw_shaft_length = 55;