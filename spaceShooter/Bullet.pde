class Bullet
{
   PVector position;
   PVector velocity;
   float bulletSpeed =3;
  Bullet(float x,float y,PVector in)
  {
  position = new PVector(x, y);
  velocity =in;
  velocity.sub(position);
  }

void draw() 
    {
    position.x+=velocity.x+1; //+1 här är bara ett test, behöver få en vector som skickar iväg dem åt rätt håll.
    position.y+=velocity.y+1;

    
    //position.x +=bulletvelocity.x;
    //position.y +=bulletvelocity.y;
    push();
    fill(255);
    ellipse(position.x, position.y,5,5);
    pop();
    }
  


}
