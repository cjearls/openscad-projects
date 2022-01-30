include <../parameters/servo_flipping_attachment_parameters.scad>
include <../parameters/9g_servo_parameters.scad>

module servo_flipping_attachment(){
  $fn = fn_value;
  assert(attachment_thickness - screw_head_hole_depth - screw_gear_hole_depth > 0, "the attachment needs to be thick enough to have all the necessary holes in it");

  difference(){
    union(){
      cube([attachment_width, attachment_length, attachment_thickness]);
      cube([attachment_length, attachment_width, attachment_thickness]);
    }
    translate([hole_centers_offset_from_edge, hole_centers_offset_from_edge, 0]){
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
}

render() servo_flipping_attachment();