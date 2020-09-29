class Bullet
{
   PVector position;
   PVector velocity;
   float bulletSpeed =7;
   color bulletColor;
  Bullet(float x,float y,PVector in)
  {
    bulletColor = color(255, 255, 0);
    position = new PVector(x, y);
    velocity=in.copy();
    velocity.mult(bulletSpeed);
  }

  Bullet(float x, float y, PVector in, boolean bullet) 
  {
    position = new PVector(x, y);
    velocity = new PVector(random(-1, 2), random(-1, 2));
    velocity.mult(bulletSpeed);
  }

  void draw() 
    {
    position.x+=velocity.x; //+1 här är bara ett test, behöver få en vector som skickar iväg dem åt rätt håll.
    position.y+=velocity.y;

    
    //position.x +=bulletvelocity.x;
    //position.y +=bulletvelocity.y;
    push();
    fill(bulletColor);
    ellipse(position.x, position.y,10,10);
    pop();
    }
  


}
