import processing.sound.*;

SoundFile playerFireSound;
SoundFile mainTheme;

PImage fiende;
PImage start;
PImage bg;
PImage playerShip;
PImage enemyBulletModel;
PImage playerBulletModel;
PImage playerMineModel;

PVector acceleration;
PVector position;
PVector velocity;
PVector gravityVector;

int gamestate=0;
int numberofenemies =10;
int score =0;
int highscore =0;
Enemy[] enemies;
Bullet[] bullets;
Bullet[] enemyBullets;
float timer;
float deltaTime;
long time;


Player player;

void setup()
{
	size(1280, 800);
	
	mainTheme = new SoundFile(this, "assets/MainTheme.wav");
	playerFireSound = new SoundFile(this, "assets/LC.wav");
	start=loadImage("assets/start.jpg");
	bg = loadImage("assets/spaceBackground.jpg");
	fiende = loadImage("assets/enemyShip.png");
	playerShip = loadImage("assets/playerShip.png");
	enemyBulletModel = loadImage("assets/laserRed.png");
	playerBulletModel = loadImage("assets/laserGreen.png");
	playerMineModel = loadImage("assets/laserGreenMine.png");
	
	fiende.resize(0, 40);
	playerShip.resize(0, 40);
	playerMineModel.resize(0,25);
	
	ellipseMode(CENTER);
	
	startScreen();

	mainTheme.loop(1, 0.2);
	
	timer = 0;
	
	noLoop();
}


void startScreen()
{
	gamestate=1;

	background(start);
	textSize(40);
	textAlign(CENTER);
	text("THE MOST INVENTIVE GAME EVER: A LIE",width/2,height/2);
	text("Press 'G' to start",width/2,height/2+60);
}


void init()
{
	gamestate=2;
	score=0;

	bullets = new Bullet[100];
	enemyBullets = new EnemyBullet[100];
	enemies = new Enemy[numberofenemies];
	player = new Player();

	createEnemies();
	
	textSize(15);
	
	loop(); 
}

void draw()
{
	if(gamestate==2)  
	{
		clearBackground();
		background(bg);

		long currentTime = millis();
		deltaTime = (currentTime - time) * 0.001f;
		timer += deltaTime;

		player.update();
		player.draw();
		
		createPlayerBullets();
	    
	    if (timer >= 3) {
			createEnemies();
	    }

		createEnemyBullets();

	    for (int i = 0; i < enemyBullets.length; i++)
	    { 
	    	boolean playerHit = false;

	    	if (enemyBullets[i] != null)
	    	{
	        	playerHit = roundCollision(player.position.x, player.position.y, player.Size,
	          enemyBullets[i].position.x, enemyBullets[i].position.y, enemyBullets[i].bulletsize);
	      	//playerHit = roundCollision(player, enemyBullets[i]);
	    	}

	    	if (playerHit)
	    	{
	    		gameOver();
	    	}
	    }

	   //=================================================================

	  	for (int i = 0; i < enemies.length; i++)
	    {
			if (enemies[i] ==null)
			{
				continue;
			}

			if (enemies[i].hitcounter >=3)
			{
				enemies[i]= null;
				continue;
			}

			{
				enemies[i].update();
				enemies[i].draw();
			}
	    }
	  
	  // Kollisionskod för player->fiendeskepp ligger här och skvalpar tills vi snyggar upp det--------------------------------------------------------------------------------------------------------------------------   
		for(int j = 0; j < enemies.length; j++)
		{
			if (enemies[j] ==null)
			{
				continue;
			}
			
			boolean krock = roundCollision(player.position.x,player.position.y,player.Size,/*characters[i].iff*/enemies[j].position.x,enemies[j].position.y,enemies[j].Size/*enemies[j].iff*/);
			
			if (krock)
			{
				gameOver();
			} 
		} 
	       
	    // Kollisionskod för bullets->fiendeskepp ligger här och skvalpar tills vi snyggar upp det--------------------------------------------------------------------------------------------------------------------------   
		for(int j = 0; j < bullets.length; j++)
		{
			if (bullets[j] == null) 
			{
				//No bullet, skip to the next one.
				continue;
			}

			for(int i = 0; i < enemies.length; i++)
			{
				if (enemies[i] ==null)
				{
					continue;
				}
				
				boolean hit = roundCollision(bullets[j].position.x,bullets[j].position.y,bullets[j].bulletsize,/*characters[i].iff*/enemies[i].position.x,enemies[i].position.y,enemies[i].Size/*enemies[j].iff*/);
				
				if (hit)
				{
					score +=100;
					bullets[j].hashit=true;
					if (bullets[j] instanceof Mine)
					{
						enemies[i].hitcounter =3;
					}
					enemies[i].hitcounter++;
				}
			}

		}  
		text("Score: " + score,width-200,40 );
		time = currentTime;   
	}
}


void clearBackground()
{

	fill(255, 255, 255);
	rect(0, 0, width, height);
}

void gameOver()
{
	if(score > highscore)
	{
		highscore = score;
	}

	textSize(40);
	textAlign(CENTER);
	fill(240);
	text("Game Over!",width/2,height/2);
	text("Your score: " + score,width/2,height/2+60 );
	text("Highscore: " + highscore,width/2,height/2+100 );
	text("Press 'r' to reset " ,width/2,height/2+140 );
	
	noLoop();
	
	player.dead=true;
}
