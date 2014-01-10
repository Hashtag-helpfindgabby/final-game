class mario {
  PImage imgc, imga;
  PVector loc, vel;
  float s, b, h;
  mario() {
    loc = new PVector(width/2, height*3/4);
    vel = new PVector(5, 5);
    s = 5;
    b = 7;
    h = s;
    imgc = loadImage("caitlin running.jpg");
    imga = loadImage("anita running.jpg");
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
      loc.x++;
    }
    if (keyPressed && key=='a') {
      loc.x--;
    }
  }
  void grow() {
    if (//eat mushroom) {
    h=b;
  }
  void hurt() {
    if(h==b && //get hit) {
      h=s;
    }
    if(h==s && //get hit) {
      displayCaitlin.return false;
      displayAnita.return false;
    }
      
}

