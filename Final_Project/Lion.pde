class Lion {
  PVector loc, vel;
  int w, h;
  PImage img;

  Lion() {
    loc = new PVector(random(-2000,-w), random(height));
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
<<<<<<< HEAD
  void obstacle() {
  }   
=======
  void reset() {
    loc.set(-2000,-w);
  }
    
>>>>>>> c63c872fe2bd282b0bf825538c3b6c305ea863f8
}

