class Pearl {
  PVector loc, vel, acc;
  PImage pearl;
  float d;
  boolean active;
  Pearl() {
    pearl = loadImage("pearl.png");
    loc = new PVector(random(0, width), -d);
    vel = new PVector(0, 1.5);
    d = 25;
  }
  void display() {
    image(pearl, loc.x, loc.y, d, d);
  }
  void fall() {
    loc.add(vel);
    if (loc.y>height) {
      loc.y = 0;
    }
  }
  void goAway() {
    loc.set(width*2, height*2);
    vel.set(0, 0);
  }
}

