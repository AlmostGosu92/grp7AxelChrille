class Player{

	PVector position = new PVector(width/2, height/2);
	PVector acceleration = new PVector();
	PVector velocity = new PVector();
	PVector move = new PVector();
	float maxSpeed = 10;
	float accMult = 45;
	float deaccMult = 3;
	float speed = 60;
	int size = 20;
	boolean dead = false;

	void draw()
	{
		
	}
	
	void update(){

		acceleration = input();
		acceleration.mult(accMult * deltaTime);

		if (acceleration.mag() == 0){
			acceleration.x -= velocity.x * deaccMult * deltaTime;
			acceleration.y -= velocity.y * deaccMult * deltaTime;
		}

		velocity.add(acceleration);

		velocity.limit(maxSpeed);

		move = velocity.copy();
		move.mult(speed * deltaTime);

		position.add(move);
		fill(0, 255, 0);
		ellipse(position.x, position.y, size, size);

		bounce();
	}


    void bounce()
    {
		if (position.x < 0 || position.x > width)
			velocity.x = velocity.x * -1;
		if (position.y < 0 || position.y > height)
			velocity.y = velocity.y * -1;
    }
}