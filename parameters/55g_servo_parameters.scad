servo_body_dimensions = [40.3, 19.75, 36.75];
overhang_height = 28.25;
overhang_extension = 6.85;
overhang_dimensions = [servo_body_dimensions[0] + (overhang_extension*2), 18.4, 2.45];
overhang_hole_radius = 4.32/2;
overhang_hole_lengthwise_offset = 2.6;
overhang_hole_widthwise_offset = 4;
overhang_hole_cut_width = 2.25;
overhang_triangle_width = 1;
overhang_triangle_height = 1.5;
overhang_triangle_length = overhang_extension;
gearbox_radii = [servo_body_dimensions[1]/2, 13.08/2, 10.75/2];
gearbox_heights = [2, 1.2, .5];
tag_base_dimensions = [24.75, 17.8, gearbox_heights[0]];
gear_height = 3.85;
teeth_outer_diameter = 5.89;
tooth_length = .3;
number_of_teeth = 26;
gear_radius = teeth_outer_diameter/2;

wire_height_offset = 3.25;
wire_dimensions = [overhang_extension*1.5, 3.5, 1.2];

total_servo_height = gear_height + gearbox_heights[0] + gearbox_heights[1] + gearbox_heights[2] + servo_body_dimensions[2];