include <../parameters/servo_flipping_attachment_parameters.scad>
include <../parameters/9g_servo_parameters.scad>

module servo_flipping_attachment(){
  $fn = fn_value;
  assert(attachment_thickness - screw_head_hole_depth - screw_gear_hole_depth > 0, "the attachment needs to be thick enough to have all the necessary holes in it");

  rotate_extrude(angle = attachment_arc_angle){
    translate([attachment_length-attachment_thickness*1.5, 0, 0]) square(size=attachment_thickness);
  }
    rotate([0, 0, attachment_angle-attachment_arc_angle])
  rotate_extrude(angle = attachment_arc_angle){
    translate([attachment_length-attachment_thickness*1.5, 0, 0]) square(size=attachment_thickness);
  }

  difference(){
    union(){
      translate([-hole_centers_offset_from_edge, -hole_centers_offset_from_edge, 0]){
        cube([attachment_length, attachment_width, attachment_thickness]);
      }
      rotate([0, 0, attachment_angle]){
        translate([-hole_centers_offset_from_edge, -hole_centers_offset_from_edge, 0]){
          cube([attachment_length, attachment_width, attachment_thickness]);
        }
      }
    }
    // Screw Head Hole
    cylinder(r = screw_head_hole_radius, h = screw_head_hole_depth);
    // Screw Shaft Hole
    cylinder(r = screw_shaft_hole_radius, h = attachment_thickness);
    // Gear Hole
    translate([0, 0, attachment_thickness - screw_gear_hole_depth]){
      cylinder(r = screw_gear_hole_radius, h = screw_gear_hole_depth);
    }
  }
}

render() servo_flipping_attachment();