class Particle{
  PVector pos;
  PVector pos_polar;
  PVector vel;
  PVector acc;
  PVector zero = new PVector(0,0);
  int[] blue;
  int[][] blues = {{66, 245, 224},{66, 227, 245},{66, 194, 245}};
  
  //Trail variables
  int ghosts = 30;
  int currentShape = 0;
  float[] ghost_x = new float[ghosts];
  float[] ghost_y = new float[ghosts];
  float[] ghost_alpha = new float[ghosts];
  

  public Particle(float x, float y){
    pos = new PVector(x, y);
    pos_polar = new PVector(sqrt(pow(x, 2) + pow(y, 2)), atan(y/x));
    vel = new PVector(0, 0);
    acc = new PVector(0, .02);
    blue = blues[(int)(Math.random()*3)];
  }
  
  public void polar(){
    pos_polar.x = sqrt(pow(pos.x, 2) + pow(pos.y, 2)); //r
    pos_polar.y = atan(pos.y/pos.x); //theta
  }
  
  public void render(Lines lines){
    vel.add(acc);
    pos.add(vel);
    polar();
    setStroke();
    trail();
    if(!checkHit(lines).equals(zero)){
      fixRotation();
      rotate();
      hit();
    }
  }
  
  public void setStroke(){
    //strokeWeight(1);
    //stroke(66, 197, 245);
    noStroke();
    fill(blue[0], blue[1], blue[2]);
  }
  
  public void trail(){
    //Function created by helloCircuits
    ghost_x[currentShape] = pos.x;
    ghost_y[currentShape] = pos.y;
    ghost_alpha[currentShape] = 255;
    for(int i = 0; i < ghosts; i++){
      fill(blue[0], blue[1], blue[2], ghost_alpha[i]);
      //circle(ghost_x[i], ghost_y[i], 20);
      circle(ghost_x[i], ghost_y[i], i*20/ghosts);
      ghost_alpha[i] -= 255/ghosts;
    }
    currentShape++;
    currentShape %= ghosts;
  }
  
  public void noTrail(){
    circle(pos.x, pos.y, 20);
  }
  
  public void fixRotation(){
    //rad %= PI;
    if(rad > PI){
      rad -= PI;
    }
    if(rad < -PI){
      rad += PI;
    }
  }
  
  public void rotate(){
    if(pos.x >= 0){
      rad += .01;
    }else{
      rad -= .01;
    }
  }
  
  public void hit(){
    pos.y -= 5;
  }
  
  public PVector checkHit(Lines lines){
    //lines.lines is the array list of lines in the object 'lines'... gotta change that name later
    for(Line line : lines.lines){
      for(int i = -5; i < 5; i++){
        for(int j = -20; j < 20; j++){
          if(((round(pos_polar.x)+i <= line.polarx) || (round(pos_polar.x)+i >= -line.polarx)) && (round(pos_polar.y*100)+j == round(100*(-PI/2+rad+line.polary)))){
            return pos_polar;
          }
        }
      }
    }
  return new PVector(0,0);
}
  
}
