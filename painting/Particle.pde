class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass = 1;
  float r2, g2, b2;

  Particle(PVector l, float r1, float g1, float b1) {
    acceleration = new PVector(0, 0.01);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    location = l.get();
    lifespan = 200;
    r2 = r1;
    g2 = g1;
    b2 = b1;
  }

  void run() { //<>//
    update();
    display();
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 10;
  }

  void display() {
    noStroke();
    fill(r2, g2, b2, lifespan*0.05);
    ellipse(location.x, location.y, 10, 10);
  }

  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }
}