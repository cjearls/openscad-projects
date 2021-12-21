include <../parameters/9g_servo_parameters.scad>

9g_motor();

module 9g_motor(){
	difference(){			
		union(){
			cube(servo_body_dimensions, center=true);
			translate([0, 0, mounting_wing_vertical_offset]) cube(mounting_wing_dimensions, center=true);
			translate([5.5,0,2.75]) cylinder(r=6, h=25.75, $fn=20, center=true);
			translate([-.5,0,2.75]) cylinder(r=1, h=25.75, $fn=20, center=true);
			translate([-1,0,2.75]) cube([5,5.6,24.5], center=true);		
			translate([5.5,0,3.65]) cylinder(r=2.35, h=29.25, $fn=20, center=true);				
		}
		translate([10,0,-11]) rotate([0,-30,0]) cube([8,13,4], center=true);
		for ( hole = [mounting_hole_separation/2, -mounting_hole_separation/2] ){
			translate([hole,0,5]) cylinder(r=2.2, h=4, $fn=20, center=true);
		}	
	}
}