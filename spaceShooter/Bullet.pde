class Bullet
{
  PVector position;
  PVector velocity;
  float bulletSpeed =7;
  color bulletColor;
  int bulletsize =10;
  int maxSpeed = 8;
  boolean hashit;
  boolean enemy = false;

  Bullet(float x,float y,PVector in)
  {
    bulletColor = color(128, 255, 0);
    position = new PVector(x, y);
    velocity=in.copy();
    velocity.mult(bulletSpeed);
    velocity.limit(maxSpeed);
  }

  Bullet(float x, float y, PVector in, boolean bullet) 
  {
    position = new PVector(x, y);
    velocity = new PVector(random(-1, 2), random(-1, 2));
    velocity.mult(bulletSpeed);
    hashit =false;
    
  }

  void draw() 
  {
     
    position.x+=velocity.x; //+1 här är bara ett test, behöver få en vector som skickar iväg dem åt rätt håll.
    position.y+=velocity.y;

    
    //position.x +=bulletvelocity.x;s
    //position.y +=bulletvelocity.y;
    push();
    translate(position.x, position.y);
    float a = velocity.heading();
    rotate(a + (PI/2));
    if (enemy)
    {
      image(enemyBulletModel, 0 - (bulletsize / 2), 0 - (bulletsize / 2));
    }
    else
    {  
      image(playerBulletModel, 0 - (bulletsize / 2), 0 - (bulletsize / 2));
    }

    /*fill(bulletColor);
    ellipse(position.x, position.y,bulletsize,bulletsize);*/
    pop();
  }
  
/*  void playerShoot()
  {a
    PVector mouseVector = new PVector(mouseX , mouseY);
    mouseVector = mouseVector.sub(player.position);
    mouseVector.normalize();
    for (int i = 0; i < bullets.length; i++) {
        if (bullets[i] == null) {
          bullets[i] = new Bullet(player.position.x, player.position.y, mouseVector);
          //we are done, break/quit the loop.
          break;
        }

        file.play(1, 0.5);
    }
  }*/
}
void createPlayerBullets()
{
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
    {
      bullets[i].draw();
    }
  }
}

void createEnemyBullets()
{
  //code for enemy bullets
  //=================================================================
   

  if (timer >= 3) {
    for (int i = 0; i < enemies.length; i++)
    { 

      if(enemies[i] == null)
      {
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
}  
