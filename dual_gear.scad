include <params.scad>
include <gears.scad>

module dual_gear() {
    difference() {
        union() {
            // Gear 1
            herringbone_gear(modul=gear_module, tooth_number=gear_teeth_1, width=gear_width, bore=0.0, pressure_angle=gear_pressure_angle, helix_angle=gear_helix_angle, optimized=false);
        
            // Gear 2
            translate([0.0, 0.0, gear_width]) {
                herringbone_gear(modul=gear_module, tooth_number=gear_teeth_2, width=gear_width + gear_2_extra_height, bore=0.0, pressure_angle=gear_pressure_angle, helix_angle=gear_helix_angle, optimized=false);
            }
        };
        
        // Shaft hole
        translate([0.0, 0.0, -eps])
            cylinder(d=shaft_diameter + shaft_extra_clearance_in_gear, h=2*gear_width + 2*eps + gear_2_extra_height);
    }
}

dual_gear();