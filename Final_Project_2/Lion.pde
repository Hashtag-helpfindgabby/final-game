class Lion {
  PVector loc, vel;
  int w, h;
  PImage img;
  float y1, y2;

  Lion() {
    y1 = random(height/2-h);
    y2 = random(height/2+h);
    loc = new PVector(random( -w), random(height));
    vel = new PVector(random(3, 5), 0);
    //if(loc.y==random(height-h,height+h)) {
    //loc.y=(random(200));
    //}
    w = 100;
    h = 50;
    img = loadImage("lion.png");
  }
  void display() {
    image(img, loc.x, loc.y, w, h);
  }
  void editloc() {
    if (loc.y>=height/2-h/2 && loc.y<=height/2+h/2) {
      loc.y=random(200);
    }
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
  void done() {
    loc.set(0, 0);
    vel.set(0, 0);
    loc.add(vel);
  }
}

