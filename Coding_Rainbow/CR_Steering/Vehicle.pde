class Vehicle {
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector steer;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed

  Vehicle(float x, float y) {
    acceleration = new PVector(0,0);
    velocity = new PVector(0,-2);
    position = new PVector(x,y);
    r = 6;
    maxspeed = 4;
    maxforce = 0.1;
  }

  // Method to update position
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    position.add(velocity);
    // Reset accelerationelertion to 0 each cycle
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  // A method that calculates a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  void seek(PVector target) {
    PVector desired = PVector.sub(target,position);  // A vector pointing from the position to the target
    
    // Scale to maximum speed
    desired.setMag(maxspeed);

    // Steering = Desired minus velocity
    steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    
    float a = PVector.angleBetween(velocity,steer);
    a = Math.max(-PI/8, Math.min(PI/8,a));
    text(a, 10,30);
    applyForce(steer);
  }
    
  void display() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + PI/2;
    //float steering = steer.heading2D() + PI/2;
    fill(127);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(position.x,position.y);
    rotate(theta);
    line(0,0,0,-10*velocity.mag());
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    //translate(position.x,position.y);
    
    rectMode(CENTER);
    rect(-r-0.5, -r*2+2.5,1,5);
    rect(r+0.5, -r*2+2.5,1,5);
    popMatrix();
    
    text(velocity.x + ", " + velocity.y, 10,10);
    
    
  }
}