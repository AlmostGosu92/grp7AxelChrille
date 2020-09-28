PImage bg;
PVector acc;
PVector pos;
PVector vel;
PVector grav;

void setup()
{
	size(1280, 800);
	bg = loadImage("spaceBackground.jpg");
}

void draw()
{
	background(bg);
}