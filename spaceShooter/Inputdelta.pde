boolean moveLeft;
boolean moveRight;
boolean moveUp;
boolean moveDown;
boolean gravity;
boolean mouseDown;
PVector inputVector = new PVector();

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
   if ( key == 'r')
   {
     init();
   }
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
   if ( key == 32) {  
      //Find empty spot in array, create list.


      for (int i = 0; i < bullets.length; i++) {
        if (bullets[i] == null) {
          bullets[i] = new Bullet(player.position.x,player.position.y,player.move);
          //we are done, break/quit the loop.
          break;
        }
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

PVector input()
{
  inputVector.x = 0;
  inputVector.y = 0;

  if (moveLeft){
    inputVector.x --;
  }
  if (moveRight){
    inputVector.x ++;
  }
  if (moveUp){
    inputVector.y --;
  }
  if (moveDown){
    inputVector.y ++;
  }

  inputVector.normalize();

  return inputVector;
}

void mousePressed() 
{
  mouseDown = true;
  
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
}

void mouseReleased() {
  mouseDown = false;
}
