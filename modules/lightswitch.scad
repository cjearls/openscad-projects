// These are the rough millimeter measurements of a light switch.
switchLength = 6.5;
switchWidth = 7;
switchDepth = 14;

module switch(switchLength, switchWidth, switchDepth){
    cylinderRadius = switchDepth;

    union(){
        cube([switchDepth, switchWidth, switchLength]);
        translate([-cylinderRadius, 0, switchLength/2]){
            rotate([270, 0, 0]){
                cylinder(r1=cylinderRadius, r2=cylinderRadius, h=switchWidth);
            }
        }
    }
}

switch(switchLength, switchWidth, switchDepth);
