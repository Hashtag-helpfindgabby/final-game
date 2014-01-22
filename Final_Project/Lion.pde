class Lion {
  PVector loc, vel;
  int w, h;
  PImage img;

  Lion() {
    loc = new PVector(random(-700,-500), random(height));
    vel = new PVector(random(6, 10), 0);
    w = 100;
    h = 50;
    img = loadImage("lion.png");
  }
  void display() {
    image(img, loc.x, loc.y, w, h);
  }

  void fall() {

    loc.add(vel);
    //add the velocity to the location
  }
  void goAway() {
    if (loc.x>0) {
      loc.set(-w, random(height));
      //if the location is beyond the screen, loc.x = 0
    }
  }
  void obstacle() {
  }   
}

