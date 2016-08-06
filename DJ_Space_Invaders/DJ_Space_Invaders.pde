Ship ship;
ArrayList<Flower> flowers = new ArrayList<Flower>();
ArrayList<Drop> drops = new ArrayList<Drop>();

void setup() {
  size(800, 400);
  ship = new Ship();
  for (int i = 0; i < 9; i++) {
    flowers.add(new Flower(i * 80 + 80, 60));
  }
}

void draw() {
  background(51);
  ship.show();  
  for (Flower f : flowers) {
    f.show();
  }
  ArrayList<Flower> hitFlowers = new ArrayList<Flower>();
  ArrayList<Drop> hitDrops = new ArrayList<Drop>();
  for (Drop d : drops) {
    d.show();
    for (Flower f : flowers) {
      if (d.hit(f)) {
        hitDrops.add(d);
        hitFlowers.add(f);
      }
    }
    d.move();
  }
  drops.removeAll(hitDrops);
  flowers.removeAll(hitFlowers);
}

void mousePressed() {
  drops.add(new Drop(ship.x, ship.y));
}

void keyPressed() {
  if (keyCode == RIGHT) {
    ship.move(1);
  }
  if (keyCode == LEFT) {
    ship.move(-1);
  }
  if (key == ' ') {
    mousePressed();
  }
}