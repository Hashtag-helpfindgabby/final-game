class mario {
  PImage imgc, imga;
  PVector loc, vel;
  float d;
  boolean move;
  mario() {
    loc = new PVector(2, height/2);
    vel = new PVector(3, 0);
    d = 100;
    imgc = loadImage("caitlin running.png");
    imga = loadImage("anita running.png");
    move = true;
  }
  boolean displayCaitlin() {
    image(imgc, loc.x, loc.y, d, d);
    return true;
  }
  boolean displayAnita() {
    image(imga, loc.x, loc.y, d, d);
    return false;
  }
  void move() {
    if (keyPressed && key=='d' && move == true) {
      //if you press d, you move forward
      loc.add(vel);
    }
    if (keyPressed && key=='a') {
      //if you press a, you move backward
      loc.sub(vel);
    }
  }
  void jump() {
    //if you press w, you move up
    if (keyPressed && key=='w') {
      vel.set(0, -3);
      loc.add(vel);
    }
    else {
      vel.set(3, 0);
    }
    if (keyPressed && key=='s') {
      vel.set(0, 3);
      loc.add(vel);
    }
    else {
      vel.set(3, 0);
    }
  }
  void reset() {
    loc.set(2, height/2);
    vel.set(5, 0);
  }

  boolean checkRunnerL(Lion l) {
    if (loc.dist(l.loc) < d/2 + l.h/2 ) {
      return true;
      //return a true value if the runner and lion touch
    }
    else {
      return false;
    }
  }
  void checkRunnerO(Obstacle o) {
    if (dist(loc.x, loc.y, o.loc.x, o.loc.y) < d/2 + o.d/2) {
      move=false;
      //if the runner touches the square, it doesnt move forward
    }
    else {
      move = true;
    }
  }
  boolean checkRunnerF (Fireballs f) {
    if (f.loc.x + f.r > loc.x && f.loc.y + f.r > loc.y && f.loc.x - f.r < loc.x + imgc.width && f.loc.y - f.r < f.loc.y + imgc.height) {
      return true;
    }
    else {
      return false;
    }
  }
  boolean checkRunnerP (Pearl p) {
    if (loc.dist(p.loc) < d/2 + p.d/2) {
      return true;
    }
    else {
      return false;
    }
  }
}

