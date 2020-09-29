PImage bg;
PVector acceleration;
PVector position;
PVector velocity;
PVector gravityVector;

int numberofenemies =30;
Enemy[] enemies;
Bullet[] bullets;
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
  bullets = new Bullet[100];
  enemies = new Enemy[numberofenemies];
  for(int i = 0; i < enemies.length; i++)
    {
      switch (int(random(0,4)))
      {
      case 0:
      enemies[i] = new Enemy(random(width),random(0,1));
      break;
      
      case 1:
      enemies[i] = new Enemy(random(width),random(height,height-5));
      break;
      
      case 2:
      enemies[i] = new Enemy(random(0,5),random(height));
      break;
     
      case 3:
      enemies[i] = new Enemy(random(width,width-5),random(height)); 
      break;
      }
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
   for (int i = 0; i < bullets.length; i++) {
    if (bullets[i] == null) {
      //No bullet, skip to the next one.
      continue;
    }
    if (bullets[i].position.x >width || bullets[i].position.x <0)
    {
    bullets[i] = null;  
    }
    if (bullets[i].position.y >height || bullets[i].position.y <0)
    {
    bullets[i] = null;  
    }
    else
      bullets[i].draw();
   }
  	
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
