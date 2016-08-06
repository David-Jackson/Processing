class Road {
  int x, y, w, h;
  int ySpeed = 1;

  Road() {
    x = floor(random(width));
    y = floor(random(height));
    w = 10;
    h = 10;
  }

  Road(int _x, int _y) {
    x = _x;
    y = _y;
    w = 10;
    h = 10;
  }
  Road(float _x, int _y) {
    x = (int)_x;
    y = _y;
    w = 10;
    h = 10;
  }
  Road(float _x, float _y) {
    x = (int)_x;
    y = (int)_y;
    w = 10;
    h = 10;
  }
  void update() {
    y += ySpeed;
  }

  void show() {
    rectMode(CENTER);
    noStroke();
    //fill(0);
    int c = floor(map(y,-h,height,0,190));
    fill(c);
    rect(x, y, w, h);
  }

  void showAll(ArrayList<Road> road) {
    
  }

  Road pair() {
    return new Road(x + minRoadWidth, y);
  }
  ArrayList<Road> cone() {
    ArrayList<Road> roads = new ArrayList<Road>();
    float curX = x;
    float curY = y;
    while (curX > 0) {
      curX--;
      curY = curY + 0.25;
      roads.add(new Road(curX, curY));
    }
    curX = x + minRoadWidth;
    curY = y;
    while (curX < height) {
      curX++;
      curY = curY + 0.25;
      roads.add(new Road(curX, curY));
    }

    return roads;
  }
  boolean offScreen() {
    return y > height;
  }
}