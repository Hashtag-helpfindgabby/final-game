class mario {
  PImage imgc, imga;
  PVector loc, vel;
  float s, b, h;
  mario() {
    loc = new PVector(2, height*3/4);
    vel = new PVector(5, 0);
    s = 100;
    b = 120;
    h = s;
    imgc = loadImage("caitlin running.png");
    imga = loadImage("anita running.png");
  }
  boolean displayCaitlin() {
    image(imgc, loc.x, loc.y, s, h);
    return true; 
  }
  boolean displayAnita() {
    image(imga, loc.x, loc.y, s, h);
    return false;
  }
  void move() {
    if (keyPressed && key=='d') {
      //if you press d, you move forward
      loc.add(vel);
    }
    if (keyPressed && key=='a') {
      //if you press a, you move backward
      loc.sub(vel);
    }
  }
  void jump() {
    //if you press w, you will jump into the air
    if(keyPressed && key=='w') {
      vel.set(5,5);
      if(loc.y>(height*2/3)+(vel.y+200)) {
        vel.set(5,-5);
      }
    } 
    else {
      vel.set(5,0);
    }
  }
}

