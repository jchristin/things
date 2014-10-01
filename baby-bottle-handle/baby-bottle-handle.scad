//
// Settings
// (Metric units in millimeters)
//

BOTTLE_DIAMETER = 50;
HANDLE_LENGTH = 70;
HANDLE_RADIUS = 15;
HANDLE_ANGLE = 5;
RING_WIDTH = 3;

////////////////

$fa = 5;
$fs = 1;

BOTTLE_RADIUS = BOTTLE_DIAMETER / 2;

module stuff() {
	cylinder(h = HANDLE_LENGTH, r = HANDLE_RADIUS);
	translate([0,0,HANDLE_LENGTH]) sphere(HANDLE_RADIUS);
}

module handle() {
	intersection() {
		stuff();
		translate([-HANDLE_RADIUS,0,0]) stuff();
	}
}

module side() {
	translate([7,0,0]) cylinder(h = RING_WIDTH, r = HANDLE_RADIUS);
	translate([22,0,-1]) rotate(HANDLE_ANGLE, [0,1,0]) handle();
}

module assembly() {
	cylinder(h = RING_WIDTH, r = BOTTLE_RADIUS + 10);
	mirror([1,0,0]) translate([BOTTLE_RADIUS, 0, 0]) side();
	translate([BOTTLE_RADIUS, 0, 0]) side();
} 

difference() {
	assembly();
	translate([0,0,-0.1]) cylinder(h = RING_WIDTH + 0.2, r = BOTTLE_RADIUS);
	translate([-100, -100, -9.9]) cube([200,200,10]);
}
