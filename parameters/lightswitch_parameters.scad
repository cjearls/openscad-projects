// This is a light switch plate parameterized on how many light switches the plate has.
numberOfSwitches = 3;

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
switchWidth = 7;
switchDepth = 14;