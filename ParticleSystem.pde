class ParticleSystem {
  ArrayList<Particle> particles; //list of particles
  PVector origin; //original position of the vector

  ParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Particle>();
  }

  void addParticle(PVector pos, color currentPartColor) {
    particles.add(new Particle(pos, currentPartColor));
  }
  
  
  void applyForce(PVector force) {
    for(Particle p: particles){
        p.applyForce(force);
    }
  }
  
  void run() {
    
   Iterator<Particle> it = particles.iterator();
  // Using an Iterator object instead of counting with int i
   while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  }
}
