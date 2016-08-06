class Drop {
  int x;
  int y;
  int r = 4;
  Drop(int a, int b) {
    x = a;
    y = b;
  }
  
  boolean hit(Flower f) {
    float d = dist(x,y,f.x,f.y);
    return (d < r + f.r);// || (y < -r);
  }
  
  void show() {
    fill(0,10,200);
    ellipse(x,y,r*2,r*2);
  }
  void move() {
    y -= 1;
  }
}