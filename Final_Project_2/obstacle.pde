class Obstacle {
  PVector loc;
  int d;
  Obstacle() {
    loc = new PVector(width/2, height/2);
    d=50;
  }
  void display1() {
    loc.set(width/2, height/2+50);
    strokeWeight(3);
    fill(140, 130, 60);
    rect(loc.x, loc.y, d, d);
  }
  void display2() {
    loc.set(width*3/4, height/4);
    strokeWeight(3);
    fill(140, 130, 60);
    rect(loc.x, loc.y, d, d);
  }
  void display3() {
    loc.set(width*3/4, height*3/4);
    strokeWeight(3);
    fill(140, 130, 60);
    rect(loc.x, loc.y, d, d);
  }
}
