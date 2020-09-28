boolean moveLeft;
boolean moveRight;
boolean moveUp;
boolean moveDown;
boolean gravity;

float speed =65;


void keyPressed()
{
  if (keyCode == LEFT || key == 'a')
    moveLeft = true;
  else if (keyCode == RIGHT || key == 'd')
    moveRight = true;  
  if (keyCode == UP || key == 'w')
    moveUp = true;
  else if (keyCode == DOWN || key == 's')
    moveDown = true;
  if ( key == 'g')
   { 
    if(gravity== false) 
      {
      gravity = true;
      println("Gravity is active, you should've worked out more mr.Ballstrong");
      }
      else 
      {gravity = false;
      println("Soar like an eagle you magnificent beast, gravity is no more");
      }
   }
}

void keyReleased()
{
  if (keyCode == LEFT || key == 'a')
    moveLeft = false;
  else if (keyCode == RIGHT || key == 'd')
    moveRight = false;
      if (keyCode == UP || key == 'w')
    moveUp = false;
  else if (keyCode == DOWN || key == 's')
    moveDown = false;
}
void acceleration()
{
    if (moveLeft) {
    acc.x = acc.x -1;
  }
  if (moveRight) {
    acc.x =acc.x +1;
  }
  if (moveUp) {
    acc.y =acc.y-1;
  }
  if (moveDown) {
    acc.y = acc.y +1;
  }
  if ((gravity == true) && (pos.y <height-1))
     { 
     acc.y+= acc.y + grav.y;
     }
}





void onEdge()
{
    if (pos.x > width+15)
    {
      pos.x=-10;
    }
    if (pos.x < -15)
    {
      pos.x=width+10;
    }
    if (pos.y >height)
    {
      vel.y = vel.y * -0.96f;
      pos.y =height;
    }
    if (pos.y <0)
    {
      vel.y = vel.y * -0.96f;
      pos.y=0;
    }
}    
