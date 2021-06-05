// Gear mechanical properties
gear_module = 2.0;
gear_width = 8.0;
gear_pressure_angle = 20.0;
gear_helix_angle=35.0;

gear_offset_factor=1.02;	// Set this to > 1.00 if gears bind.

// Dual gear defining properties
gear_teeth_1 = 30;
gear_teeth_2 = 8;
gear_2_extra_height = 2.0;

// Shaft properties
shaft_diameter=5.0;
shaft_extra_clearance_in_gear=0.5;

// Motor properties
motor_linear_side_length=42.00;
motor_shaft_diameter=5.0;
motor_shaft_length=22.00;
motor_body_height=33.70;
motor_screw_pattern_side_length=31.0;
motor_screw_holes_diameter=3.0;

// Motor mounting properties
motor_locator_walls_side_clearance=2.00;
motor_locator_walls_thickness=3.00;
motor_locator_walls_depth=3.00;
motor_centre_circle_diameter=22.0;
motor_centre_circle_depth=2.30;
motor_shaft_clearance_diameter=10.0;
motor_screw_hole_extra_clearance=0.50;
motor_screw_holes_cap_diameter=6.50;
motor_screw_holes_cap_depth=2.60;








// Computed parameters - do not change
gear_offset_length = gear_offset_factor*0.5*gear_module*(gear_teeth_1 + gear_teeth_2);

// Model-forming properties
$fn = 25;
eps=0.001;  // Very small number, to ensure non-zero overlaps.