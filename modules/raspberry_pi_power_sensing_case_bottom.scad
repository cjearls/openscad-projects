include <../parameters/raspberry_pi_power_sensing_case_parameters.scad>

module raspberry_pi_power_sensing_case_bottom(){
    union(){
        cube([base_case_dimensions[0], base_case_dimensions[1], case_thickness]);
        for (hole = mounting_holes){
            translate(hole + [raspberry_pi_offset[0], raspberry_pi_offset[1], 0]) cylinder(r = mounting_hole_radius - hole_radius_offset, h = raspberry_pi_offset[2] + pcb_dimensions[2]);
        }
        cube([case_thickness, base_case_dimensions[1], base_case_dimensions[2]]);
        translate([0, base_case_dimensions[1] - case_thickness, 0]) cube([base_case_dimensions[0], case_thickness, base_case_dimensions[2]]);
        translate([base_case_dimensions[0] - case_thickness, 0, 0])cube([case_thickness, base_case_dimensions[1], base_case_dimensions[2]]);
    }
}

raspberry_pi_power_sensing_case_bottom();