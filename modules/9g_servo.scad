include <../parameters/9g_servo_parameters.scad>

$fn=100;
9g_servo();

module 9g_servo(){
	union(){
		cube(servo_body_dimensions);
		// Mounting overhang
		translate([-overhang_extension, 0, overhang_height]){
			difference(){
				cube(overhang_dimensions);
				
				// First mounting hole
				translate([overhang_hole_offset, overhang_dimensions[1]/2, 0]){
					cylinder(h=overhang_dimensions[2], r=overhang_hole_radius);
				}
				translate([0, overhang_dimensions[1]/2 - overhang_hole_cut_width/2, 0]){
					cube([overhang_hole_offset, overhang_hole_cut_width, overhang_dimensions[2]]);
				}

				// Second mounting hole
				translate([overhang_dimensions[0] - overhang_hole_offset, overhang_dimensions[1]/2, 0]){
					cylinder(h=overhang_dimensions[2], r=overhang_hole_radius);
				}
				translate([overhang_dimensions[0] - overhang_hole_offset, overhang_dimensions[1]/2 - overhang_hole_cut_width/2, 0]){
					cube([overhang_hole_offset, overhang_hole_cut_width, overhang_dimensions[2]]);
				}
			}
		}

		// Gearbox
		union(){
			// Major gearbox
			translate([gearbox_major_radius, gearbox_major_radius, 0]){
				cylinder(h=servo_body_dimensions[2]+gearbox_height, r=gearbox_major_radius);
			}

			// Minor gearbox
			translate([gearbox_major_radius*2, gearbox_major_radius, 0]){
				cylinder(h=servo_body_dimensions[2]+gearbox_height, r=gearbox_minor_radius);
			}

			// Gear
			translate([gearbox_major_radius, gearbox_major_radius, 0]){
				cylinder(h=servo_body_dimensions[2]+gearbox_height+gear_height, r=gear_radius);
			}
		}

		// Wire
		translate([-wire_dimensions[0], (servo_body_dimensions[1]-wire_dimensions[1])/2, wire_height_offset]){
			cube(wire_dimensions);
		}
	}
}