class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover (float m, float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = m;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display(float r, float g, float b) {
    noStroke();
    fill(r, g, b, 50);
    ellipse(location.x, location.y, mass, mass);
  }
}