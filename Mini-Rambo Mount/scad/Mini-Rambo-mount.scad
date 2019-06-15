module ramboholes() {
	difference() {
		cylinder(r=7/2, h=7, center=true, $fn=30);
		cylinder(r=7/4, h=8, center=true, $fn=30);
	}
}

module rambopegs() {
	union() {
		translate([95/2, 95/2, 0]) {
			ramboholes();
			translate([0,0,-2.5]) cylinder(r=11/2, h=4, center=true);
		}
		translate([95/2, -95/2, 0]) {
			ramboholes();
			translate([0,0,-2.5]) cylinder(r=11/2, h=4, center=true);
		}
		translate([-13.5, 95/2, 0]) {
			ramboholes();
			translate([0,0,-2.5]) cylinder(r=11/2, h=4, center=true);
		}
		translate([-13.5, -95/2, 0]) {
			ramboholes();
			translate([0,0,-2.5]) cylinder(r=11/2, h=4, center=true);
		}
	}
}
module ramboframe() {
	translate([102/2,0,-2.5]) cube(size=[25,106, 4], center=true);

	translate([102/3 - 7.5,0,-2.5]) cube(size=[4,96, 4], center=true);
	translate([102/5 - 8.5,0,-2.5]) cube(size=[4,96, 4], center=true);
	translate([102/16 - 9.5,0,-2.5]) cube(size=[4,96, 4], center=true);
	translate([-96/16 - 10.5,0,-2.5]) cube(size=[5,96, 4], center=true);
    
    translate([17,101/2,-2.5]) cube(size=[62,5, 4], center=true);
	translate([17,-101/2,-2.5]) cube(size=[62,5, 4], center=true);
	translate([17,0,-2.5]) cube(size=[66,4, 4], center=true);
}


module arduino()
{
	translate([119/2, -114/2, -1]) rotate([90, 0, 90]) {
		difference() {
			// the arduino cube
			cube([114, 53, 4]);
		}
	}
}

module mountBraces()
{
	 rotate([90, -90, 0]) {
		translate([-4.5, -127/2, -110/2])
		linear_extrude(height = 4, center = true, convexity = 10, twist = 0)
		polygon(points=[[0,0],[20,0],[0,20]]);
		
		translate([-4.5, -127/2, 110/2])
		linear_extrude(height = 4, center = true, convexity = 10, twist = 0)
		polygon(points=[[0,0],[20,0],[0,20]]);
	}
}

module rambo()
{
	rambopegs();
	ramboframe();
}



rambo();
arduino();
mountBraces();