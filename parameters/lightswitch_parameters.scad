// This is a light switch plate parameterized on how many light switches the plate has.
numberOfSwitches = 2;

// These parameters shouldn't change, but are the measurements in inches of the various lengths on a standard light switch.
plateToEdgeSwitchInches = 1.375;
switchToSwitchInches = 1.875;
switchHeightInches = 1;
switchWidthInches = 3/8;
verticalScrewDistanceInches = 2.375;
plateHeightInches = 4.5;
screwDiameterInches = 3/16;

// These are the parameters converted into the metric units used by OpenSCAD
inchesToMm = 25.4;
plateToEdgeSwitch = plateToEdgeSwitchInches * inchesToMm;
switchToSwitch = switchToSwitchInches * inchesToMm;
switchHeight = switchHeightInches * inchesToMm;
switchWidth = switchWidthInches * inchesToMm;
verticalScrewDistance = verticalScrewDistanceInches * inchesToMm;
plateHeight = plateHeightInches * inchesToMm;
screwDiameter = screwDiameterInches * inchesToMm;

// Undefined parameters that I'm guessing at
plateDepth = 1;

// These are the rough millimeter measurements of a light switch.
switchLength = 6.5;
switchDepth = 14;

// These are the rough dimensions of a light switch screw.
screwLength = 13.85;
screwHeadRadius = 6.9/2;
screwHeadHeight = 2.3;
screwBodyRadius = 3.42/2;

switchRotationMultiplier = 30; // This is a multiplier used to get the actual angle of the switches in the switch assembly. It is multiplied by the -1 to 1 angle parameter of the light switch module.

screwVerticalDistanceFromEdge = (plateHeight-verticalScrewDistance)/2;