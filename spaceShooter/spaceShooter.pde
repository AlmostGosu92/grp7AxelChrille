PImage bg;
PVector acceleration;
PVector position;
PVector velocity;
PVector gravityVector;

float deltaTime;
long time;

Player player;

void setup()
{
	size(1280, 800);
	bg = loadImage("spaceBackground.jpg");
	ellipseMode(CENTER);

	init();
}

void init()
{
	player = new Player();
}

void draw()
{
	clearBackground();
	background(bg);

	long currentTime = millis();
	deltaTime = (currentTime - time) * 0.001f;

//	player.draw();
	player.update();
}

void clearBackground()
{

	fill(255, 255, 255);
	rect(0, 0, width, height);
}