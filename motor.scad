include <params.scad>

module motor_mockup() {
    
    translate([0.0, 0.0, -motor_body_height/2])
        cube([motor_linear_side_length, motor_linear_side_length, motor_body_height], center=true);
    
    // Locator ring
    translate([0.0, 0.0, -eps])
        cylinder(d=motor_centre_circle_diameter, h=motor_centre_circle_depth+eps);
    
    // Shaft
    translate([0.0, 0.0, motor_centre_circle_depth-eps])
        cylinder(d=motor_shaft_diameter, h=motor_shaft_length+eps);
    
};

module motor_locator_positive() {
    // Walls    
    difference() {
        translate([0.0, 0.0, -motor_locator_walls_depth/2 + eps/2])
            cube([motor_linear_side_length + motor_locator_walls_side_clearance + 2*motor_locator_walls_thickness, motor_linear_side_length + motor_locator_walls_side_clearance + 2*motor_locator_walls_thickness, motor_locator_walls_depth + eps], center=true);
        
        translate([0.0, 0.0, -motor_locator_walls_depth/2 + eps/2])
            cube([motor_linear_side_length + motor_locator_walls_side_clearance, motor_linear_side_length + motor_locator_walls_side_clearance, motor_locator_walls_depth + 2*eps], center=true);
    };
}

module motor_locator_negative(plate_thickness) {
    // Locator hole for motor
    translate([0.0, 0.0, -eps])
        cylinder(d=motor_centre_circle_diameter, h=motor_centre_circle_depth+eps);
    
    // Hole for motor shaft
    translate([0.0, 0.0, 0.0])
        cylinder(d=motor_shaft_clearance_diameter, h=motor_shaft_length + motor_centre_circle_depth + 2*eps);
    
            // Screw holes for motor
            translate([motor_screw_pattern_side_length/2, motor_screw_pattern_side_length/2, -eps])
                cylinder(d=motor_screw_holes_diameter, h=plate_thickness + 2*eps);
            translate([motor_screw_pattern_side_length/2, -motor_screw_pattern_side_length/2, -eps])
                cylinder(d=motor_screw_holes_diameter, h=plate_thickness + 2*eps);
            translate([-motor_screw_pattern_side_length/2, motor_screw_pattern_side_length/2, -eps])
                cylinder(d=motor_screw_holes_diameter, h=plate_thickness + 2*eps);
            translate([-motor_screw_pattern_side_length/2, -motor_screw_pattern_side_length/2, -eps])
                cylinder(d=motor_screw_holes_diameter, h=plate_thickness + 2*eps);
    
            // Recesses for screw cap heads
            translate([0.0, 0.0, plate_thickness - motor_screw_holes_cap_depth + eps]) {
                translate([motor_screw_pattern_side_length/2, motor_screw_pattern_side_length/2])
                    cylinder(d=motor_screw_holes_cap_diameter, h=motor_screw_holes_cap_depth);
                translate([motor_screw_pattern_side_length/2, -motor_screw_pattern_side_length/2])
                    cylinder(d=motor_screw_holes_cap_diameter, h=motor_screw_holes_cap_depth);
                translate([-motor_screw_pattern_side_length/2, motor_screw_pattern_side_length/2])
                    cylinder(d=motor_screw_holes_cap_diameter, h=motor_screw_holes_cap_depth);
                translate([-motor_screw_pattern_side_length/2, -motor_screw_pattern_side_length/2])
                    cylinder(d=motor_screw_holes_cap_diameter, h=motor_screw_holes_cap_depth);
            };
}

motor_locator_positive();

color("red", alpha=0.8)
motor_locator_negative(plate_thickness=5.0);

color("gray", alpha=0.5)
motor_mockup();