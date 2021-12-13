// This is a bin with a parameterized number of compartments, interior of the compartments, thickness of compartment walls, thickness of the exterior wall, lid tolerance, and lid overhang
compartmentLength = 20;
compartmentWidth = 15;
compartmentHeight = 20;
compartmentRows = 6;
compartmentColumns = 12;
interiorWallThickness = 1;
exteriorWallThickness = 1.5;
lidTolerance = 0; // This is the amount larger than the exterior of the box the interior of the lid will be
lidOverhang = 5; // This is the amount that the lid hangs down past the top of the box. A value of 0 would result in a flat surface for the lid.

function getInteriorDimensions(compartmentLength, compartmentWidth, compartmentHeight) = [compartmentLength, compartmentWidth, compartmentHeight];
function getExteriorDimensions(compartmentLength, compartmentWidth, compartmentHeight, interiorWallThickness, exteriorWallThickness, compartmentRows, compartmentColumns) = [compartmentRows * compartmentLength, compartmentColumns * compartmentWidth, compartmentHeight] + [2*exteriorWallThickness + (compartmentRows-1)*interiorWallThickness, 2*exteriorWallThickness + (compartmentColumns-1)*interiorWallThickness, exteriorWallThickness];
function getLidInteriorDimensions(exteriorDimensions, lidTolerance, lidOverhang) = [exteriorDimensions[0]+(2*lidTolerance), exteriorDimensions[1]+2*lidTolerance, lidOverhang];
function getLidExteriorDimensions(lidInteriorDimensions, exteriorWallThickness) = lidInteriorDimensions + [2*exteriorWallThickness, 2*exteriorWallThickness, exteriorWallThickness];

// Box
module parameterized_compartments(compartmentLength, compartmentWidth, compartmentHeight, compartmentRows, compartmentColumns, interiorWallThickness, exteriorWallThickness){
    interiorDimensions = getInteriorDimensions(compartmentLength, compartmentWidth, compartmentHeight);
    exteriorDimensions = getExteriorDimensions(compartmentLength, compartmentWidth, compartmentHeight, interiorWallThickness, exteriorWallThickness, compartmentRows, compartmentColumns);

    difference(){
        cube(exteriorDimensions, center=false);
        for(rowIndex=[0:1:compartmentRows-1]){
            for(columnIndex=[0:1:compartmentColumns-1]){
                translate([exteriorWallThickness+(rowIndex*(interiorWallThickness+compartmentLength)), exteriorWallThickness+(columnIndex*(interiorWallThickness+compartmentWidth)), exteriorWallThickness]){
                    cube(interiorDimensions, center=false);
                }
            }
        }
    }
}

// Lid
module parameterized_compartment_lid(compartmentLength, compartmentWidth, compartmentHeight, compartmentRows, compartmentColumns, interiorWallThickness, exteriorWallThickness, lidTolerance, lidOverhang){
    exteriorDimensions = getExteriorDimensions(compartmentLength, compartmentWidth, compartmentHeight, interiorWallThickness, exteriorWallThickness, compartmentRows, compartmentColumns);
    lidInteriorDimensions = getLidInteriorDimensions(exteriorDimensions, lidTolerance, lidOverhang);
    lidExteriorDimensions = getLidExteriorDimensions(lidInteriorDimensions, exteriorWallThickness);

    difference(){
        cube(lidExteriorDimensions, center=false);
        translate([exteriorWallThickness, exteriorWallThickness, exteriorWallThickness]){
            cube(lidInteriorDimensions, center=false);
        }
    }
}

parameterized_compartments(compartmentLength, compartmentWidth, compartmentHeight, compartmentRows, compartmentColumns, interiorWallThickness, exteriorWallThickness);
exteriorWidth = getExteriorDimensions(compartmentLength, compartmentWidth, compartmentHeight, interiorWallThickness, exteriorWallThickness, compartmentRows, compartmentColumns)[1];
translate([0, exteriorWidth * -1.1, 0]){
    parameterized_compartment_lid(compartmentLength, compartmentWidth, compartmentHeight, compartmentRows, compartmentColumns, interiorWallThickness, exteriorWallThickness, lidTolerance, lidOverhang);
}