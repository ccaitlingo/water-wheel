class Lines{
  ArrayList<Line> lines;
  
  Lines(){
    lines = new ArrayList<Line>();
  }
  
  void run(){
    rotate(rad);
    for (Line l : lines){
      l.render();
    }
  }
  
  void addLine(Line l){
    lines.add(l);
  }
  
}
