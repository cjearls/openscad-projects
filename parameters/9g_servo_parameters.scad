servo_body_dimensions = [22.5, 12, 22.5];
overhang_height = 15.6;
overhang_extension = 5;
overhang_dimensions = [servo_body_dimensions[0] + (overhang_extension*2), servo_body_dimensions[1], 2.5];
overhang_hole_radius = 2.15/2;
overhang_hole_offset = 2;
overhang_hole_cut_width = 1.2;
gearbox_height = 4.5;
gearbox_major_radius = servo_body_dimensions[1]/2;
gearbox_minor_radius = 5.7/2;
gear_height = 3;

teeth_outer_diameter = 4.912;
tooth_length = .198;
number_of_teeth = 21;
gear_radius = teeth_outer_diameter/2;

wire_height_offset = 4.5;
wire_dimensions = [overhang_extension*1.5, 3.5, 1.2];

total_servo_height = gear_height + gearbox_height + servo_body_dimensions[2];