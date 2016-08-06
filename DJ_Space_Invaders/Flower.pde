class Flower {
  int x = width/2;
  int y = 50;
  int r = 30;
  Flower(){}
  
  Flower(int a, int b) {
    x = a;
    y = b;
  }
  
  void show() {
    fill(255, 0, 200);
    ellipse(x,y,r*2,r*2);
  }
  
  void move(int dir) {
    ship.x += dir*5;
  }
}