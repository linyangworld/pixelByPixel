Mover[] movers = new Mover[25000];
Attractor a;
float x, y;
float tx, ty;
float r, g, b;
float tr, tg, tb;

void setup() {
  size (960, 540);

  tx = 0;
  ty = 1000;
  tr = 0;
  tg = 2000;
  tb = 4000;

  for (int i=0; i<movers.length; i++) {
    movers[i] = new Mover(2, random(width), random(height));
  }
}

void draw() {
  background(0);

  x  = map(noise(tx), 0, 1, 0, width);
  y  = map(noise(ty), 0, 1, 0, height);
  a = new Attractor(20, x, y);
  //a.display();
  tx += 0.001;
  ty += 0.001;

  r = map(noise(tr), 0, 1, 0, 255);
  g = map(noise(tg), 0, 1, 0, 255);  
  b = map(noise(tb), 0, 1, 0, 255);
  tr += 0.001;
  tg += 0.001;
  tb += 0.001;

  for (int i=0; i<movers.length; i++) {
    PVector force = a.attract(movers[i]);
    movers[i].applyForce(force);
    movers[i].update();
    movers[i].display(r, g, b);
  }
}