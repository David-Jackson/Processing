class Ship {
  int x = width/2;
  int y = height-30;
  void show() {
    fill(255);
    rectMode(CENTER);
    rect(x, y, 20, 20);
  }
  
  void move(int dir) {
    ship.x += dir*5;
    ship.x = Math.min(width-10, Math.max(10, ship.x));
  }
}