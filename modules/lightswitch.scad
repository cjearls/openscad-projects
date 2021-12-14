// These are the rough millimeter measurements of a light switch.
switchLength = 6.5;
switchWidth = 7;
switchDepth = 14;

module switch(switchLength, switchWidth, switchDepth){
    cube([switchWidth, switchDepth, switchLength]);
}

switch(switchLength, switchWidth, switchDepth);
