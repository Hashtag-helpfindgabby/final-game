class Obstacle {
  PVector loc;
  int d;
  Obstacle() {
    loc = new PVector(width/2,height/2);
    d=50;
  }
  void display() {
    strokeWeight(3);
    fill(140,130,60);
    rect(loc.x,loc.y,d,d);
  }
}
    
