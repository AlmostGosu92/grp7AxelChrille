class Enemy


{
    //Our class variables
    PVector position; //character position
    PVector velocity; //character direction
    boolean enemyTrue = false;
    float Size = random(20,25);
    int hitcounter;
    
    
    //character Constructor, called when we type new Character(x, y);
    Enemy(float x, float y)
    {
        //Set our position when we create the code.
        position = new PVector(x, y);

        //Create the velocity vector and give it a random direction.
        velocity = new PVector();
        velocity.x = random(11) - 5;
        velocity.y = random(11) - 5;
        hitcounter=0;
    }

    //Update our character
    void update()
    {
        bounce();
        position.x += velocity.x;
        position.y += velocity.y;
    }

    void draw()
    {    

      push();
      translate(position.x,position.y);
      float a = velocity.heading();
      rotate(a+(PI/2));
      image(fiende, -20, -20);
     /* stroke(50,224,50);
      fill(50,224,50);
      strokeWeight(4.5);
      line(-Size/2,0,-Size/2,Size);
      line(Size/2,0,Size/2,Size);
      ellipse(0,0, Size, Size);
      fill(75,230,75);
      ellipse(0,0,Size/1.5,Size/1.5);*/
      pop();
    }

void bounce()
    {
        if (position.x < 0 || position.x > width)
            velocity.x = velocity.x * -1;
        if (position.y < 0 || position.y > height)
            velocity.y = velocity.y * -1;
    } 
} 
void createEnemies()
{

  for(int i = 0; i < enemies.length; i++)
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
   }
}  
