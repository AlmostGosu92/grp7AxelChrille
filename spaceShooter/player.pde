class Player{

	PVector position = new PVector(width/2, height/2);
	PVector acceleration = new PVector();
	PVector velocity = new PVector();
	PVector move = new PVector();
	float maxSpeed = 2000;
	float accMult = 45;
	float deaccMult = 15;
	float speed = 500;
	int size = 20;
	boolean dead = false;
	float Size = random(20, 25);
	float b;


	void draw()
	{   
	    push();
	    translate(position.x, position.y);
	    float a = move.heading();

	    if (velocity.mag() > 0.02)
	    {
		    player.velocity.x = 0;
    		player.velocity.y = 0;
    		rotate(a + (PI/2));
	    	b = a;
		} else  {
	    	rotate(b + (PI/2));
		}
	    image(playerShip, -20, -20);

	    //(starship, -20, -20,Size*2,Size*2);
	    
	    pop();   
	}
	
	void update()
	{
		 
		 acceleration = input();
	    acceleration.mult(accMult * deltaTime);

	    if (acceleration.mag() == 0 )
	    {
	    	acceleration.x -= velocity.x * deaccMult * deltaTime;
	    	acceleration.y -= velocity.y * deaccMult * deltaTime;
	    }

	    velocity.add(acceleration);
	    velocity.limit(maxSpeed);

	    move = velocity.copy();
	   	move.mult(speed * deltaTime);
	    position.add(move);

	    push();
	    translate(position.x,position.y);

		  position.x += velocity.x;
		  position.y += velocity.y;
		  pop();
      bounce();
	}


    void bounce()
    {
		if (position.x < (size / 2) || position.x > width - (size / 2))
			velocity.x = velocity.x * -1;
		if (position.y < (size / 2) || position.y > height - (size / 2))
			velocity.y = velocity.y * -1;
    }
}
