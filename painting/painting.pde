ArrayList<ParticleSystem> systems;
float r, g, b;
float tr, tg, tb;

void setup() {
  size(1920, 1080);
  background(0);

  systems = new ArrayList<ParticleSystem>();

  tr = 0;
  tg = 2000;
  tb = 4000;
}

void draw() {
  for (ParticleSystem ps : systems) {
    ps.run();
    ps.addParticle();
  }

  r = map(noise(tr), 0, 1, 0, 255);
  g = map(noise(tg), 0, 1, 0, 255);  
  b = map(noise(tb), 0, 1, 0, 255);
  tr += 0.01;
  tg += 0.01;
  tb += 0.01;
}

void mouseDragged() {
  systems.add(new ParticleSystem(1, new PVector(mouseX, mouseY), r, g, b));

  //loadPixels();
  //int pixel = mouseX + mouseY * width;
  //pixels[pixel] = color(0);
  //updatePixels();
}