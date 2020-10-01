import processing.sound.*;

SoundFile file;

PImage bg;
PVector acceleration;
PVector position;
PVector velocity;
PVector gravityVector;

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
	bg = loadImage("spaceBackground.jpg");
	ellipseMode(CENTER);
	init();
  file = new SoundFile(this, "LC.wav");
  timer = 0;
   
  
}

void init()
{
  
  loop();
  score=0;
  //highscore =0;
  bullets = new Bullet[100];
  enemyBullets = new EnemyBullet[100];
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
  timer += deltaTime;

	player.update();
	player.draw();

   for (int i = 0; i < bullets.length; i++) {
    if (bullets[i] == null) {
      //No bullet, skip to the next one.
      continue;
    }
    if (bullets[i].position.x >width || bullets[i].position.x <0)
    {
    bullets[i] = null;  
    continue;
    }
    if (bullets[i].position.y >height || bullets[i].position.y <0)
    {
    bullets[i] = null;  
    continue;
    }
    if (bullets[i].hashit ==true)
    {
    bullets[i] = null;  
    continue;
    }
    else
      bullets[i].draw();
   }


  //code for enemy bullets
  //=================================================================
   

  if (timer >= 3) {
    println("timer: "+timer);
    for (int i = 0; i < enemies.length; i++)
    { 

      if(enemies[i] == null)
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
        continue;
      }

      for (int j = 0; j < enemyBullets.length; j++) {
        if (enemyBullets[j] == null) {
          PVector random = new PVector(random(-1, 2), random(-1, 2));
          enemyBullets[j] = new EnemyBullet(enemies[i].position.x, enemies[i].position.y,
             random);
          //we are done, break/quit the loop.
          break;

        }

      }
      
    }

    timer = 0;
  }
  //remove enemyBullets if out of screen or hit, otherwise
  for(int i = 0; i < enemyBullets.length; i++)
  {
    if (enemyBullets[i] == null)
    {
      continue;
    }
    if (enemyBullets[i].position.x >width || enemyBullets[i].position.x <0)
    {
      enemyBullets[i] = null;  
      continue;
    }
    if (enemyBullets[i].position.y >height || enemyBullets[i].position.y <0)
    {
      enemyBullets[i] = null;  
      continue;
    }
    if (enemyBullets[i].hashit ==true)
    {
      enemyBullets[i] = null;  
      continue;
    }
    else
    {
      enemyBullets[i].draw();
    }  
  }

    for (int i = 0; i < enemyBullets.length; i++)
    { 
      boolean playerHit = false;
      if (enemyBullets[i] != null)
      {
        playerHit = roundCollision(player.position.x, player.position.y, player.Size,
          enemyBullets[i].position.x, enemyBullets[i].position.y, enemyBullets[i].bulletsize);
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
            println("vi satte, woohoo");
            score +=100;
            bullets[j].hashit=true;
            enemies[i].hitcounter++;
          } 
        }

      }  
      text("Score: " + score,width-200,40 );
    time = currentTime;   
}

void clearBackground()
{

	fill(255, 255, 255);
	rect(0, 0, width, height);
}

void gameOver()
{
  if(score > highscore);
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
