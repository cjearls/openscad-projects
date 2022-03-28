include <../parameters/raspberry_pi_power_sensing_case_parameters.scad>

module raspberry_pi_power_sensing_case_bottom(){
    union(){
        cube([pcb_dimensions[0], pcb_dimensions[1], case_thickness]);
        for (hole = mounting_holes){
            translate(hole + [raspberry_pi_offset[0], raspberry_pi_offset[1], 0]) cylinder(r = mounting_hole_radius - hole_radius_offset, h = raspberry_pi_offset[2] + pcb_dimensions[2]);
        }
    }
}

raspberry_pi_power_sensing_case_bottom();