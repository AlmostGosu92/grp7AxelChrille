class Enemy


{
    //Our class variables
    PVector position; //character position
    PVector velocity; //character direction
    boolean enemyTrue = false;
    float Size = random(20,25);

    
    
    //character Constructor, called when we type new Character(x, y);
    Enemy(float x, float y)
    {
        //Set our position when we create the code.
        position = new PVector(x, y);

        //Create the velocity vector and give it a random direction.
        velocity = new PVector();
        velocity.x = random(11) - 5;
        velocity.y = random(11) - 5;
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
      stroke(50,224,50);
      fill(50,224,50);
      float a = velocity.heading();
      rotate(a+(PI/2));
      strokeWeight(4.5);
      line(-Size/2,0,-Size/2,Size);
      line(Size/2,0,Size/2,Size);
      ellipse(0,0, Size, Size);
      fill(75,230,75);
      ellipse(0,0,Size/1.5,Size/1.5);
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
  
  
//boolean roundCollision(float x1, float y1, float size1, boolean b1, float x2, float y2, float size2, boolean b2)
//{
//  float maxDistance = (size1/2 + size2/2);
 
//  //first a quick check to see if we are too far away in x or y direction
//  //if we are far away we dont collide so just return false and be done.
//  if(b1 && b2 ==false)
//  {
//    return false;
//  }
//  if(abs(x1 - x2) > maxDistance || abs(y1 - y2) > maxDistance)
//  {
//    return false;
    
//  }
//  //we then run the slower distance calculation
//  //dist uses Pythagoras to get exact distance, if we still are to far away we are not colliding.
//  else if(dist(x1, y1, x2, y2) > maxDistance)
//  {
//    return false;
//  }
//  //We now know the points are closer then the distance so we are colliding!
//  else if(b1 == false && b2 == false)
//  {
//  return false;
//  }
//  else
//  {

//   return true;
//  }
//}  
  
//void checkforend()
//  {
//    int zombiecounter =0;
//    for(int i = 0; i < characters.length; i++)
//      {
//        if (characters[i].zombiebrood == true)
//        zombiecounter++;
//      }
//      if (zombiecounter >= characters.length)
//      {
//         noLoop();
//         textSize(40);
//         textAlign(CENTER);
//         fill(0);
//         text("Game Over!",width/2,height/2);
//         gametime =millis();
//         gametime = (gametime-starttime)/1000f;
//         String endtime = String.format("it took %.2f seconds for the infected to win" ,gametime); // .format, %.2f sätter att man ska input ,gametime med 2 decimaler.
//         text(endtime, width/2,height/2+60);
//         text("press mousekey for reset of spread simulation",width/2,height/2+120);
//       }
    
