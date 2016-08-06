class Car {

  PVector carLocation;
  float carHeading;
  float carSpeed, maxSpeed;
  float steerAngle;
  float maxSteerAngle = PI/4;
  float wheelBase, minWB, maxWB;

  boolean plus, minus, up, down, left, right, steerLock;

  PVector frontWheel;
  PVector backWheel;

  void init() {
    up = down = left = right = steerLock = false;

    carLocation = new PVector(width/2, height/2);
    carHeading = PI;
    carSpeed = 1;
    maxSpeed = 10;
    steerAngle = -maxSteerAngle;
    wheelBase = 50;
    minWB = 30;
    maxWB = 150;
  }

  void update() {
    frontWheel =  new PVector(carLocation.x+(wheelBase/2)*sin(carHeading), carLocation.y+(wheelBase/2)*cos(carHeading));
    backWheel =  new PVector(carLocation.x-(wheelBase/2)*sin(carHeading), carLocation.y-(wheelBase/2)*cos(carHeading));

    drawCar();

    frontWheel.add(carSpeed*sin(carHeading+steerAngle), carSpeed*cos(carHeading+steerAngle), 0);
    backWheel.add(carSpeed*sin(carHeading), carSpeed*cos(carHeading), 0);

    carLocation.set(frontWheel.x+backWheel.x, frontWheel.y+backWheel.y, 0);
    carLocation.div(2);

    if (carLocation.x<0) carLocation.x=width; 
    if (carLocation.x>width) carLocation.x=0; 
    if (carLocation.y<0) carLocation.y=height; 
    if (carLocation.y>height) carLocation.y=0; 

    drawStats();

    carHeading = atan2( frontWheel.x - backWheel.x, frontWheel.y - backWheel.y );

    // LEFT
    if (left)
    {
      if (steerAngle < maxSteerAngle) steerAngle += 0.08;
      if (steerAngle>maxSteerAngle) steerAngle = maxSteerAngle;
    } else
    {
      if (!steerLock) if (steerAngle > 0) steerAngle -= 0.08;
    }


    // RIGHT
    if (right)
    {
      if (steerAngle >  -maxSteerAngle)  steerAngle -= 0.08;
      if (steerAngle<-maxSteerAngle) steerAngle = -maxSteerAngle;
    } else
    {
      if (!steerLock) if (steerAngle < 0) steerAngle += 0.08;
    }

    // UP
    if (up)
    {
      if (carSpeed<maxSpeed) carSpeed += 0.05;
    } else
    {
    } 

    // DOWN
    if (down)
    {
      if (carSpeed>0) carSpeed -= 0.15; //brake
      else
        if (abs(carSpeed)<maxSpeed) carSpeed -= 0.05; // reverse
    } else
    {
    }

    // PLUS
    if (plus)
    {
      if (wheelBase<maxWB) wheelBase += 1;
    } else
    {
    }

    // MINUS
    if (minus)
    {
      if (wheelBase>minWB) wheelBase -= 1;
    } else
    {
    }

    if (abs(steerAngle)<0.08) steerAngle = 0;


    if (carSpeed>0) carSpeed -= 0.01; //friction for forward
    if (carSpeed<0) carSpeed += 0.01; //friction for backward

    if ((!up && !down) && (abs(carSpeed)<0.01))  carSpeed=0;
  }






  void reset() {
    carLocation.set(width/2, height/2, 0);
    steerAngle = 0;
    carSpeed = 0;
    carHeading = 2*PI;
    wheelBase = 50;
  }

  void drawCar() {
    // body of vehicle
    pushMatrix();

    translate(carLocation.x, carLocation.y);
    rotate(-carHeading);

    rectMode(CENTER);
    fill(255);
    rect(0, 0, wheelBase/3, wheelBase+wheelBase/2, 3, 3, wheelBase/(wheelBase/20), wheelBase/(wheelBase/20));
    fill(200);
    rect(0, 0, wheelBase/5, wheelBase/1.9, 3, 3, wheelBase/(wheelBase/15), wheelBase/(wheelBase/15));

    popMatrix();

    // end: body of vehicle

    // front axle
    pushMatrix();
    translate(frontWheel.x, frontWheel.y);
    rotate(-carHeading);
    strokeWeight(2);
    line (-wheelBase/7, 0, wheelBase/7, 0);
    strokeWeight(1);
    popMatrix();
    // end: front axle


    // front left wheel
    pushMatrix();
    translate(frontWheel.x+sin(carHeading+PI/2)*wheelBase/7, frontWheel.y+cos(carHeading+PI/2)*wheelBase/7);
    // sin(carHeading+PI/2) and cos(carHeading+PI/2) helps to place wheel to correct position shifted to side by (wheelBase/7)
    // otherwise it would circle adound front regarding to a heading
    // I don't know to work well with these Processing matrix translate/rotate things

    rotate(-steerAngle-carHeading);
    rectMode(CENTER);
    fill(150);
    rect(0, 0, wheelBase/7, wheelBase/3, wheelBase/(wheelBase/10));
    popMatrix();
    // end: front left wheel


    // front right wheel
    pushMatrix();
    translate(frontWheel.x-sin(carHeading+PI/2)*wheelBase/7, frontWheel.y-cos(carHeading+PI/2)*wheelBase/7);
    rotate(-steerAngle-carHeading);
    rectMode(CENTER);
    fill(150);
    rect(0, 0, wheelBase/7, wheelBase/3, wheelBase/(wheelBase/10));
    popMatrix();
    // end: front right wheel


    // back wheels
    pushMatrix();

    translate(backWheel.x, backWheel.y);
    rotate(-carHeading);

    rectMode(CENTER);
    fill(150);

    strokeWeight(2);
    line(-wheelBase/7, 0, wheelBase/7, 0);
    strokeWeight(1);


    rect(-wheelBase/7, 0, wheelBase/7, wheelBase/3, wheelBase/(wheelBase/10));
    rect(wheelBase/7, 0, wheelBase/7, wheelBase/3, wheelBase/(wheelBase/10));

    popMatrix();

    // end: back wheels
  }

  void drawStats() {
    fill(255);
    if (carSpeed<0) text("®", 5, height-40);
    text("Speed:         "+carSpeed, 20, height-40);
    text("Heading:      ("+round(degrees(carHeading))+"º)   "+carHeading, 20, height-30);
    text("Steer angle:  ("+round(degrees(steerAngle))+"º)   "+steerAngle, 20, height-20);
    text("Wheel base:    "+wheelBase, 20, height-10);

    // prcessing.js messes text so I separated it
    text("Instructions:", 2, 10);
    text("↑", 2, 25);
    text("accelerate", 32, 25);
    text("←", 2, 35);
    text("steer left", 32, 35);
    text("→", 2, 45);
    text("steer right", 32, 45);
    text("↓", 2, 55);
    text("deccelerate", 32, 55);
    text("+", 2, 65);
    text("lengthen wheelbase", 32, 65);
    text("-", 2, 75);
    text("shorten wheelbase", 32, 75);
    text("A", 2, 85);
    text("lock steering", 32, 85);
    text("spacebar  RESET", 2, 100);

    // ⭕⭕⭕
    if (up) text("◉", 16, 25);
    if (left) text("◉", 16, 35);
    if (right) text("◉", 16, 45);
    if (down) text("◉", 16, 55);

    if (plus) text("◉", 16, 65);
    if (minus) text("◉", 16, 75);
    if (steerLock) text("◉", 16, 85);
    // ⭕⭕⭕

    fill(255);
  }
}