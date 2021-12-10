// This is a box with a parameterized interior, thickness, lid tolerance, and lid overhang
interiorLength = 10;
interiorWidth = 7;
interiorHeight = 4;
wallThickness = 0.2;
lidTolerance = 0.05; // This is the amount larger than the exterior of the box the interior of the lid will be
lidOverhang = 1; // This is the amount that the lid hangs down past the top of the box. A value of 0 would result in a flat surface for the lid.

// Derived Values
wallThicknessVector = [2*wallThickness, 2*wallThickness, wallThickness]; // This can be added to interior dimensions to get the exterior dimensions for the box or lid
interiorDimensions = [interiorLength, interiorWidth, interiorHeight];
exteriorDimensions = interiorDimensions + wallThicknessVector;
lidInteriorDimensions = [exteriorDimensions[0]+(2*lidTolerance), exteriorDimensions[1]+2*lidTolerance, lidOverhang];
lidExteriorDimensions = lidInteriorDimensions + wallThicknessVector;

// Box
difference(){
    cube(exteriorDimensions, center=false);
    translate([wallThickness, wallThickness, wallThickness]){
        cube(interiorDimensions, center=false);
    }
}

// Lid
// This flips the lid upside down for viewing
translate([-1*(wallThickness+lidTolerance), -1*(wallThickness+lidTolerance), exteriorDimensions[2]*1.5]){
mirror([0, 0, 1]){
    difference(){
        cube(lidExteriorDimensions, center=false);
        translate([wallThickness, wallThickness, wallThickness]){
            cube(lidInteriorDimensions, center=false);
        }
    }
}}