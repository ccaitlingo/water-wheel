class Line{
  float x1;
  float y1;
  float x2;
  float y2;
  float polarx;
  float polary;
  
  public Line(float x1, float y1, float x2, float y2, float angle){
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.polarx = line_length;
    this.polary = angle;
  }
  
  public void render(){
    strokeWeight(1);
    stroke(0);
    rotate(polary);
    line(x1, y1, x2, y2);
  }

}
