Car car;
ArrayList<Road> roads = new ArrayList<Road>();
int minRoadWidth = 100;
float xoff = 0.0;
float startingY;
void setup() {
  size(300,500);
  car = new Car();
  float n = noise(xoff) * (width-minRoadWidth);
  startingY = -n;
  Road r = new Road(n, startingY);
  roads.add(r);
  roads.add(r.pair());
  roads.addAll(r.cone());
}



void draw() {
  background(0);
  fill(255);
  text(roads.size(), 20,20);
  xoff = xoff + .01;
  float n = noise(xoff) * (width-minRoadWidth);
  Road road = new Road(n,startingY);
  roads.add(road);
  roads.add(road.pair());
  
  ArrayList<Road> removeList = new ArrayList<Road>();
  for(Road r : roads) {
    r.update();
    r.show();
    if (r.offScreen()) {
      removeList.add(r);
    }
  }
  roads.removeAll(removeList);
  
  car.show();
}

void keyPressed() {
  if (keyCode == RIGHT) {
    car.move(1);
  }
  if (keyCode == LEFT) {
    car.move(-1);
  }
}