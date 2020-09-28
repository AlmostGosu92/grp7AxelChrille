PImage bg;
PVector acceleration;
PVector position;
PVector velocity;
PVector gravityVector;

int numberofenemies =30;
Enemy[] enemies;
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
  enemies = new Enemy[numberofenemies];
  for(int i = 0; i < enemies.length; i++)
    {                 
    enemies[i] = new Enemy(random(width,width-10),random(height,height-10));
    }
	player = new Player();
}

void draw()
{
	clearBackground();
	background(bg);

	long currentTime = millis();
	deltaTime = (currentTime - time) * 0.001f;

	player.draw();
	player.update();
  	
  	for (int i = 0; i < enemies.length; i++)
  	{
	  	enemies[i].update();
	  	enemies[i].draw();

  	}
}

void clearBackground()
{

	fill(255, 255, 255);
	rect(0, 0, width, height);
}
