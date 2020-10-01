class Mine extends Bullet
{
int minesize=12;


  Mine(float x, float y, PVector in)
  {
    super(x, y, in);
    position = new PVector(x, y);
    velocity = in.copy();
    velocity.mult(0);
 }
   void draw() 
  {
    push();
    position.x+=velocity.x; //+1 här är bara ett test, behöver få en vector som skickar iväg dem åt rätt håll.
    position.y+=velocity.y;
    bulletColor = color(255, 0, 255);
    fill(bulletColor);
    ellipse(position.x, position.y,minesize,minesize);
    pop();
  }
}
