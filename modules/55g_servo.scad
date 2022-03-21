include <../parameters/55g_servo_parameters.scad>
use <../libraries/triangular_teeth.scad>

$fn=100;
55g_servo();

module 55g_servo(servo_body_dimensions = servo_body_dimensions,
  overhang_height = overhang_height,
  overhang_extension = overhang_extension,
  overhang_dimensions = overhang_dimensions,
  overhang_hole_radius = overhang_hole_radius,
  overhang_hole_lengthwise_offset = overhang_hole_lengthwise_offset,
  overhang_hole_widthwise_offset = overhang_hole_widthwise_offset,
  overhang_hole_cut_width = overhang_hole_cut_width,
  gearbox_heights = gearbox_heights,
  gearbox_radii = gearbox_radii,
  gear_radius = gear_radius,
  gear_height = gear_height,
  wire_height_offset = wire_height_offset,
  wire_dimensions = wire_dimensions){
  assert(len(gearbox_radii) == len(gearbox_heights), "there needs to be the same number of heights and radii for the gearboxes");

	union(){
		cube(servo_body_dimensions);
		// Mounting overhang
		translate([-overhang_extension, 0, overhang_height]){
      union(){
        difference(){
          cube(overhang_dimensions);
          
          // First mounting holes
          for(iteration = [0, 1]){
            translate([0, (iteration == 0 ? 1 : -1) * (overhang_dimensions[1]/2 - overhang_hole_widthwise_offset), 0]){
              translate([overhang_hole_lengthwise_offset, overhang_dimensions[1]/2, 0]){
                cylinder(h=overhang_dimensions[2], r=overhang_hole_radius);
              }
              translate([0, overhang_dimensions[1]/2 - overhang_hole_cut_width/2, 0]){
                cube([overhang_hole_lengthwise_offset, overhang_hole_cut_width, overhang_dimensions[2]]);
              }
            }
          }

          // Second mounting holes
          for(iteration = [0, 1]){
            translate([0, (iteration == 0 ? 1 : -1) * (overhang_dimensions[1]/2 - overhang_hole_widthwise_offset), 0]){
              translate([overhang_dimensions[0] - overhang_hole_lengthwise_offset, overhang_dimensions[1]/2, 0]){
                cylinder(h=overhang_dimensions[2], r=overhang_hole_radius);
              }
              translate([overhang_dimensions[0] - overhang_hole_lengthwise_offset, overhang_dimensions[1]/2 - overhang_hole_cut_width/2, 0]){
                cube([overhang_hole_lengthwise_offset, overhang_hole_cut_width, overhang_dimensions[2]]);
              }
            }
          }
        }

        // Triangular pieces
        translate([0, 0, overhang_dimensions[2]]){
          translate([0, overhang_triangle_width + (overhang_dimensions[1]/2 - overhang_triangle_width/2), 0]){
            rotate([90, 0, 0]){
              linear_extrude(overhang_triangle_width) polygon(points=[[0, 0], [overhang_triangle_length, 0], [overhang_triangle_length, overhang_triangle_height]]);
            }
          }
          translate([overhang_extension + overhang_triangle_length + servo_body_dimensions[0], overhang_triangle_width + (overhang_dimensions[1]/2 - overhang_triangle_width/2), 0]){
            mirror([1, 0, 0]){
              rotate([90, 0, 0]){
                linear_extrude(overhang_triangle_width) polygon(points=[[0, 0], [overhang_triangle_length, 0], [overhang_triangle_length, overhang_triangle_height]]);
              }
            }
          }
        }
      }
		}

		// Gearbox
		union(){
			// Gearboxes
      translate([gearbox_radii[0], gearbox_radii[0], 0]){
        cylinder(h=servo_body_dimensions[2]+gearbox_heights[0], r=gearbox_radii[0]);
      }
      translate([gearbox_radii[0], gearbox_radii[0], 0]){
        cylinder(h=servo_body_dimensions[2]+gearbox_heights[0]+gearbox_heights[1], r=gearbox_radii[1]);
      }
      translate([gearbox_radii[0], gearbox_radii[0], 0]){
        cylinder(h=servo_body_dimensions[2]+gearbox_heights[0]+gearbox_heights[1]+gearbox_heights[2], r=gearbox_radii[2]);
      }
      
			// Gear
			translate([gearbox_radii[0], gearbox_radii[0], 0]){
				triangular_teeth(inner_diameter = teeth_outer_diameter - tooth_length*2, tooth_length = tooth_length, number_of_teeth = number_of_teeth, height = gearbox_heights[0]+gearbox_heights[1]+gearbox_heights[2]+gear_height+servo_body_dimensions[2]);
			}

      // Tag Base
      translate([gearbox_radii[0], (servo_body_dimensions[1]-tag_base_dimensions[1])/2, servo_body_dimensions[2]]){
        cube(tag_base_dimensions);
      }
		}

		// Wire
		translate([-wire_dimensions[0], (servo_body_dimensions[1]-wire_dimensions[1])/2, wire_height_offset]){
			cube(wire_dimensions);
		}
	}
}