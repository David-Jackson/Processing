
int minSpace = 50;
int maxSpace = 200;

Pillars pillars = new Pillars();

void setup() {
  size(300,500);
}

void draw() {
  background(51);
  pillars.update();
}

void mousePressed() {
  float space = random(minSpace, maxSpace);
  float topPillar = random(minSpace, height-space-minSpace);
  float bottomPillar =  height-space-topPillar;
  Pillar p1 = new Pillar();
  p1.create(width/2,0,minSpace,topPillar);
  pillars.add(p1);
  Pillar p2 = new Pillar();
  p2.create(width/2,height-bottomPillar,minSpace,height);
  pillars.add(p2);
}

void newPillars() {
  background(51);
  float space = random(minSpace, maxSpace);
  float topPillar = random(minSpace, height-space-minSpace);
  float bottomPillar =  height-space-topPillar;
  fill(0,0,255);
  rect(width/2,0,minSpace,topPillar);
  fill(255,0,0);
  rect(width/2,height-bottomPillar,minSpace,height);
}