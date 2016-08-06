class Car {
  int x,y;
  int w = 5;
  int h = w;
  
  Car() {
    x = width/2;
    y = height - (2 * h);
  }
  
  void show() {
    rectMode(CENTER);
    fill(255);
    rect(x,y,w,h);
  }
  void move(int dir) {
    x += dir*5;
    x = Math.min(width-10, Math.max(10, x));
  }
}