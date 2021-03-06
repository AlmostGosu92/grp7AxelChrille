class Player
{
	PVector position = new PVector(width/2, height/2);
	PVector acceleration = new PVector();
	PVector velocity = new PVector();
	PVector move = new PVector();

	float maxSpeed = 5;
	float accMult = 45;
	float deaccMult = 3;
	float speed = 60;
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
			player.move.x = 0;
			player.move.y = 0;
			rotate(a + (PI/2));
			b = a;
		}
		else  
		{
			rotate(b + (PI/2));
		}

		image(playerShip, -20, -20);

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

		bounce();

		position.x += velocity.x;
		position.y += velocity.y;
		
		pop();
	}


    void bounce()
    {
		if (position.x < (size / 2) || position.x > width - (size / 2))
			velocity.x = velocity.x * -1;
		if (position.y < (size / 2) || position.y > height - (size / 2))
			velocity.y = velocity.y * -1;
    }
}
