// This is a box with a parameterized interior, thickness, lid tolerance, and lid overhang
interiorLength = 100;
interiorWidth = 70;
interiorHeight = 40;
wallThickness = 2;
lidTolerance = 0.5; // This is the amount larger than the exterior of the box the interior of the lid will be
lidOverhang = 10; // This is the amount that the lid hangs down past the top of the box. A value of 0 would result in a flat surface for the lid.

function getInteriorDimensions(interiorLength, interiorWidth, interiorHeight) = [interiorLength, interiorWidth, interiorHeight];
function getExteriorDimensions(interiorLength, interiorWidth, interiorHeight, wallThickness) = [interiorLength, interiorWidth, interiorHeight] + [2*wallThickness, 2*wallThickness, wallThickness];
function getLidInteriorDimensions(exteriorDimensions, lidTolerance, lidOverhang) = [exteriorDimensions[0]+(2*lidTolerance), exteriorDimensions[1]+2*lidTolerance, lidOverhang];
function getLidExteriorDimensions(lidInteriorDimensions, wallThickness) = lidInteriorDimensions + [2*wallThickness, 2*wallThickness, wallThickness];

// Box
module parameterized_box(interiorLength, interiorWidth, interiorHeight, wallThickness){
    interiorDimensions = getInteriorDimensions(interiorLength, interiorWidth, interiorHeight);
    exteriorDimensions = getExteriorDimensions(interiorLength, interiorWidth, interiorHeight, wallThickness);

    difference(){
        cube(exteriorDimensions, center=false);
        translate([wallThickness, wallThickness, wallThickness]){
            cube(interiorDimensions, center=false);
        }
    }
}

// Lid
module parameterized_lid(interiorLength, interiorWidth, interiorHeight, wallThickness, lidTolerance, lidOverhang){
    exteriorDimensions = getExteriorDimensions(interiorLength, interiorWidth, interiorHeight, wallThickness);
    lidInteriorDimensions = getLidInteriorDimensions(exteriorDimensions, lidTolerance, lidOverhang);
    lidExteriorDimensions = getLidExteriorDimensions(lidInteriorDimensions, wallThickness);

    difference(){
        cube(lidExteriorDimensions, center=false);
        translate([wallThickness, wallThickness, wallThickness]){
            cube(lidInteriorDimensions, center=false);
        }
    }
}

parameterized_box(interiorLength, interiorWidth, interiorHeight, wallThickness);
translate([interiorLength*1.1+wallThickness*2, 0, 0]){
    parameterized_lid(interiorLength, interiorWidth, interiorHeight, wallThickness, lidTolerance, lidOverhang);
}