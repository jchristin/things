COVER_RADIUS = 30;
COVER_WIDTH = 30;
COVER_LENGTH = 20;
COVER_THICKNESS = 4;

PIN_THICKNESS = 1.5;
PIN_WIDTH = 4;
PIN_LENGTH = 16;
PIN_SPACING = 16;

module pin() {
	translate([0,0,PIN_LENGTH / 2]) cube([PIN_THICKNESS,PIN_WIDTH,PIN_LENGTH], center = true);
}

difference() {
	translate([0,0,COVER_RADIUS]) sphere(COVER_RADIUS);
	translate([0,0,50 + COVER_THICKNESS]) cube(100, center = true);
	translate([0,50 + COVER_LENGTH / 2,0]) cube(100, center = true);
	translate([0, -50 - COVER_LENGTH / 2,0]) cube(100, center = true);
	translate([50 + COVER_WIDTH / 2,0,0]) cube(100, center = true);
	translate([-50 - COVER_WIDTH / 2,0,0]) cube(100, center = true);
}

translate([PIN_SPACING / 2,0,COVER_THICKNESS]) pin();
translate([-PIN_SPACING / 2,0,COVER_THICKNESS]) pin();


