class Attractor {
  PVector location;
  float mass;
  float G;

  Attractor(float m, float x, float y) {
    location = new PVector(x, y);
    mass = m;
    G = 0.4;
  }

  PVector attract(Mover m) {
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    distance = constrain(distance, 10.0, 20.0);
    
    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
  
  void display() {
    noStroke();
    fill(0);
    ellipse(location.x, location.y, mass, mass);
  }
}