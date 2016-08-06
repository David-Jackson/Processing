class Pillars {
  ArrayList<Pillar> pillars = new ArrayList<Pillar>();
  ArrayList<Integer> cleanList = new ArrayList<Integer>();
  float speed = 1;
  
  void add(Pillar p) {
    pillars.add(p);
  }
  void update() {
    for (Pillar p : pillars) {
      noStroke();
      fill(100,255,100);
      rect(p.x, p.y, p.h, p.w);
      p.x -= speed;
    }
  }
}