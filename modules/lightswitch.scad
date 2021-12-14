// These are the rough millimeter measurements of a light switch.
switchLength = 6.5;
switchWidth = 7;
switchDepth = 14;

module switch(switchLength, switchWidth, switchDepth){
    cylinderRadius = switchDepth;
    translate([cylinderRadius, -switchWidth/2, -switchLength/2]){
        union(){
            cube([switchDepth, switchWidth, switchLength]);
            translate([-cylinderRadius, 0, switchLength/2]){
                rotate([270, 0, 0]){
                    cylinder(r1=cylinderRadius, r2=cylinderRadius, h=switchWidth);
                }
            }
        }
    }
}

// This animates the switch.
if($t < 0.5){
    rotate([0, -40 + $t*(160), 0])
    switch(switchLength, switchWidth, switchDepth);
}else{
    rotate([0, 40 - ($t-0.5)*(160), 0])
    switch(switchLength, switchWidth, switchDepth);
}
