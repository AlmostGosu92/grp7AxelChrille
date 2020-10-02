//for(int j = 0; j < enemies.length; j++)
//    {
//      boolean krock = roundCollision(player.position.x,player.position.y,player.Size,/*characters[i]*/.iff,enemies[j].position.x,enemies[j].position.y,enemies[j].Size,/*enemies[j].iff*/);
//    } 
      //if (i != j && smitta ==true)
      //{
      //  characters[i].zombiebrood=true;
      //  characters[j].zombiebrood=true; 
      //  if (characters[i] instanceof Humans)
      //  {
      //    characters[i] = new Zombies(characters[i].position.x,characters[i].position.y);
      //  }
      //  if (characters[j] instanceof Humans)
      //  {
      //    characters[j] = new Zombies(characters[j].position.x,characters[j].position.y);
      //  }
      //  characters[j].zombiebrood=true; 
      //}
      

boolean roundCollision(float x1, float y1, float size1, float x2, float y2, float size2)
{
  float maxDistance = (size1/2 + size2/2);
 
  //first a quick check if we're the same or not.
 // if(b1 && b2 ==false)
  //{
  //  return false;
  //}
    //first a quick check to see if we are too far away in x or y direction
  //if we are far away we dont collide so just return false and be done.
  if(abs(x1 - x2) > maxDistance || abs(y1 - y2) > maxDistance)
  {
    return false;
    
  }
  //we then run the slower distance calculation
  //dist uses Pythagoras to get exact distance, if we still are to far away we are not colliding.
  else if(dist(x1, y1, x2, y2) > maxDistance)
  {
    return false;
  }
  //We now know the points are closer then the distance so we are colliding!
  //else if(b1 == false && b2 == false)
  //{
  //return false;
  //}
  //else
  {
//    println("A human got infected");
   return true;
  }
} 

/*boolean roundCollision(Object object1, Object object2)
{
	float maxDistance = (object1.size / 2 + object2.size / 2);


	if(abs(object1.position.x - object2.position.x) > maxDistance || abs(object1.position.y - object2.position.y) > maxDistance)
	{
		return false;
	  
	}
	else if(dist(object1.position.x, object1.position.y, object2.position.x, object2.position.y) > maxDistance)
	{
		return false;
	}

	else
	{
		return true;
	}
} 
  */
