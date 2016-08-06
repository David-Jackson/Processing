
ArrayList<Ball> balls = new ArrayList<Ball>();

void setup() {
  size(600,400);
  for (int i = 0; i < 1000; i++) {
    balls.add(new Ball());
  }
}

void draw() {
  background(51);
  noStroke();
  ellipse(mouseX,mouseY,10,10);
  
  for (Ball a : balls) {
    rect(a.pos.x, a.pos.y, 1, 10);
    a.update();
  }
}

void mousePressed() {
  Ball b = new Ball();
  b.init(mouseX,mouseY);
  balls.add(b);
}