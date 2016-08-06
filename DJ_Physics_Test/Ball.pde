class Ball {
  PVector pos = new PVector(random(0,width), random(-100,height+100));
  PVector vel = new PVector(0,0);
  PVector acc = new PVector(0,1);
  
  void init(int a, int b) {
    pos.x = a;
    pos.y = b;
  }
  
  void update() {
    vel.add(acc);
    pos.add(vel);
    
    if (pos.y >= height) {
      pos.y = random(-1000,-10);
      vel.y = 0;
    }
  }
}