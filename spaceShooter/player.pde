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
	float Size = random(20, 25);

	void draw()
	{
		push();
	    translate(position.x,position.y);
	    stroke(255,224,50);
	    fill(255,50,50);
	    velocity = input();
	    float a = velocity.heading();
	    rotate(a-(PI/2));
	    strokeWeight(4.5);
	    line(-Size/2,0,-Size/2,Size);
	    line(Size/2,0,Size/2,Size);
	    ellipse(0,0, Size, Size);
	    fill(255,75,75);
	    ellipse(0,0,Size/1.5,Size/1.5);
	    pop();
	}
	
	void update()
	{
		bounce();
		position.x += velocity.x;
		position.y += velocity.y;

	/*	acceleration = input();
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

		bounce();*/
	}


    void bounce()
    {
		if (position.x < 0 || position.x > width)
			velocity.x = velocity.x * -1;
		if (position.y < 0 || position.y > height)
			velocity.y = velocity.y * -1;
    }
}