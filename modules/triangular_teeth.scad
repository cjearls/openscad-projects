// The goal of this module is to create a hollow cylinder with a number of triangular teeth on the inside.
function get_circle_coordinates(angle, radius) = [radius * cos(angle), radius * sin(angle)];

module triangular_teeth(outer_diameter, inner_diameter, tooth_length, number_of_teeth, height){
    assert(number_of_teeth > 2, "This module doesn't make any sense with fewer than 3 teeth");
    assert(outer_diameter > inner_diameter, "This module doesn't make any sense with a larger inner diameter than the outer diameter");
    assert(tooth_length < inner_diameter/2, "The teeth can't be longer than the inner radius, or it'll just be a filled-in cylinder");

    difference(){
        linear_extrude(height=height){
            circle(r=outer_diameter/2);
        }
        linear_extrude(height=height){
            polygon(points = [for (index = [0 : 2*number_of_teeth]) get_circle_coordinates(
                angle = (360*index)/(2*number_of_teeth),
                radius = index % 2 == 0 ? inner_diameter/2 : inner_diameter/2 - tooth_length)]);
        }
    }
}

triangular_teeth(outer_diameter = 6.95, inner_diameter = 4.912, tooth_length = .2, number_of_teeth = 21, height = 5);