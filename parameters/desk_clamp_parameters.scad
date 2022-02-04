desk_depth = 18.2;
desk_width = 16;

// The screw standard doesn't make bolts with a hex head, which are easier to screw, so these are the dimensions for my own modified screws
screw_standard_name = "M8";
screw_head_height = 6.8;
screw_head_radius = 13/2;
// This scales the screw down in the x and y directions so it screws into the nut effectively
screw_tolerance_scaling_factor = .85;
desk_clamp_thickness = 5;
desk_clamp_above_length = 25;
desk_clamp_width = 10;
desk_clamp_total_gap_height = desk_depth + 20;
desk_clamp_hole_distance_from_edge = desk_width/2;
desk_clamp_hole_distance_from_clamp_end = 5;
desk_clamp_below_length = desk_clamp_hole_distance_from_edge + desk_clamp_hole_distance_from_clamp_end;
desk_clamp_hole_diameter_clearance = 3;
screw_shaft_length = desk_clamp_total_gap_height;

desk_clamp_threaded_slot_tolerance_offset = 0.5;
desk_clamp_threaded_slot_thickness = desk_clamp_thickness;
desk_clamp_threaded_slot_hole_distance_from_edge = desk_clamp_hole_distance_from_clamp_end + desk_clamp_threaded_slot_tolerance_offset;
desk_clamp_threaded_slot_length = desk_clamp_threaded_slot_hole_distance_from_edge*2;
desk_clamp_threaded_slot_width = desk_clamp_width;
desk_clamp_threaded_slot_total_height = desk_clamp_threaded_slot_thickness;