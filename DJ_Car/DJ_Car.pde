Car car;

void setup() {
  fullScreen(2);//size(1200, 800);
  car = new Car();
  car.init();
}

void draw() {
  background(51);
  car.update();
}

void keyPressed()
{

  if (keyCode==32) // spacebar
  {
    car.reset();
  }

  if (keyCode==65) // A
  {
    car.steerLock = !car.steerLock;
  } 

  if (keyCode==61)  // +
  {
    car.plus = true;
  }

  if (keyCode==173) // -
  {
    car.minus = true;
  }



  if (key == CODED)
  {
    switch(keyCode) {
    case LEFT:
      car.left=true;
      break;
    case RIGHT:
      car.right=true;
      break;
    case UP:
      car.up=true;
      break;
    case DOWN:
      car.down=true;
      break;
    }
  }
}


void keyReleased()
{



  if (keyCode==61)  // +
  {
    car.plus = false;
  }

  if (keyCode==173) // -
  {
    car.minus = false;
  }


  if (key == CODED)
  {
    switch(keyCode) {
    case LEFT:
      car.left=false;
      break;
    case RIGHT:
      car.right=false;
      break;
    case UP:
      car.up=false;
      break;
    case DOWN:
      car.down=false;
      break;
    }
  }
}