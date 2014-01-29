class Fireballs {
  PVector loc, vel;
  int d;
  int r;
  PImage img;

  Fireballs() {
    loc= new PVector(random(width), random(height));
    vel= new PVector(random(3, 7), random(2, 7));
    d=30;
    r=d/2;
    img= loadImage("fireball.png");
  }
  void display() {
    image(img, loc.x, loc.y, d, d);
  }
  void move() {
    loc.add(vel);
  }
  void bounce() {
    if (loc.x>width) {
      vel.x=-vel.x;
    }
    if (loc.x<0) {
      vel.x=-vel.x;
    }
    if (loc.y>height) {
      vel.y=-vel.y;
    }
    if (loc.y<0) {
      vel.y=-vel.y;
    }
  }
  void reset() {
    loc.set(random(width), random(height));
    vel.set(random(3, 7), random(2, 7));
  }
}

