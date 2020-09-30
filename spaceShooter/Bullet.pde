class Bullet
{
   PVector position;
   PVector velocity;
   float bulletSpeed =7;
   color bulletColor;
   int bulletsize =10;
   int maxSpeed = 8;
   boolean hashit;
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

    
    //position.x +=bulletvelocity.x;
    //position.y +=bulletvelocity.y;
    push();
    fill(bulletColor);
    ellipse(position.x, position.y,bulletsize,bulletsize);
    pop();
  }
  
/*  void playerShoot()
  {
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
