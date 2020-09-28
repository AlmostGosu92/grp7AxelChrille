
PVector pos, acc, vel,grav;

float deltaTime;
float lastTime;
float friction =0.99;

void setup()
{
  size(1280,1024);
  pos = new PVector(width/2,height/2);
  acc = new PVector(0,0);
  vel = new PVector(0,0);
  grav = new PVector(0,0.5);
  ellipseMode(CENTER);
  frameRate(30);
}

void draw() {
  long currentTime = millis();
  deltaTime = (currentTime - lastTime)*0.001;
  //println(deltaTime);
  acc.mult(0);
  background(50, 166, 240);
  
  acceleration();
  acc.normalize();
  acc.mult(deltaTime*speed);
  vel.add(acc);
    PVector move = vel.copy();

    move.mult(speed * deltaTime);
  pos.add(move);
  
  
  onEdge();
 
       
   if (keyPressed ==false)
    {
    vel.mult(friction);
    }
    push();
    translate(pos.x,pos.y);
    float a =vel.heading();
    rotate(a+(PI/2));
    strokeWeight(5);
    line(0,-10,0,-30);
    ellipse(0,0, 20, 20);
    pop();
    
    lastTime = millis();
 
}
