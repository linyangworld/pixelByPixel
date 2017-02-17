class ParticleSystem{
  ArrayList<Particle> particles;
  PVector origin;
  float r1, g1, b1;
  
  ParticleSystem(int num, PVector v, float r, float g, float b) {
    particles = new ArrayList<Particle>();
    origin = v.get();
    r1 = r;
    g1 = g;
    b1 = b;
    for(int i=0; i<num; i++) {
      particles.add(new Particle(origin, r1, g1, b1));
    }
  }
  
  void run() {
    for (int i = particles.size()-1; i>=0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
  
  void addParticle() {
    particles.add(new Particle(origin, r1, g1, b1));
  }
  
  boolean dead() {
    if(particles.isEmpty()) {
      return true;
    } else {
      return false;
    }
  }
}