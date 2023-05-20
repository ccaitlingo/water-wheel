public float rad = PI/3;   //rotation in radians
public int line_length = 200;     //line length
float x1 = 0.0;
float y1 = line_length/2;
float x2 = 0.0;
float y2 = -line_length/2;
float polarx = 200;
float polary = rad;
Particles particles;
Lines lines;

void setup(){
  size(800, 800);
  particles = new Particles();
  lines = new Lines();
  makeLines(2);
}

void draw(){
  background(255);
  translate(400, 400);  //Sets the origin to be in the middle of the screen
  particles.run(lines);
  lines.run();
}

void mouseClicked(){
  particles.addParticle(new Particle(mouseX-400, mouseY-400));
}

void makeParticles(int amount){
  for (int i = 0; i < amount; i++){
    particles.addParticle(new Particle(30 + i*2, -100));
  }
}

void makeLines(int amount){
  for (int i = 0; i < amount; i++){
    lines.addLine(new Line(x1, y1, x2, y2, i*PI/amount));
  }
}
