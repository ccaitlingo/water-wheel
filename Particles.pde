class Particles{
  ArrayList<Particle> particles;
  
  Particles(){
    particles = new ArrayList<Particle>();
  }
  
  void run(Lines lines){
    for (Particle p : particles){
      p.render(lines);
    }
  }
  
  void addParticle(Particle p){
    particles.add(p);
  }
  
}
