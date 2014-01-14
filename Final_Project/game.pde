mario m;
boolean start, stop;
PImage optc, opta;
PImage startHere;
boolean goC, goA;
void setup() {
  background(0);
  startHere =loadImage("background.jpg");
  size(displayWidth, displayHeight);
  optc = loadImage("caitlin.png");
  opta = loadImage("anita.png");
  start= true;
  size(500, 500);
  m = new mario();
  goC=false;
  goA=false;
}
void draw() {
  if (start == true && stop == false) {
    //start screen
    background(0);
    image(startHere, 0, 0);
    rectMode(CENTER);
    fill(250);
    stroke(250);
    rect(width/2, 100, 350, 100);
    textAlign(CENTER, CENTER);
    textSize(25);
    fill(0);
    text("Choose your character!", width/2, 100);
    image(optc, 75, 220, 200, 250);
    image(opta, 520, 220, 200, 250);
    if (mousePressed) {
      start= true;
      stop = true;
    }
  }
  if (start == true && stop == true) {
    background(0);
    if (mousePressed && mouseX>75 && mouseX<75+200 
      && mouseY>220 && mouseY<220+250) {
      goC = true;
    }
    if (mousePressed && mouseX>520 && mouseX<520+200 
      && mouseY>220 && mouseY<220+250) {
      goA=true;
    }
    if (goC==true) {
      m.move();
      m.displayCaitlin();
      
    }
    if(goA==true) {
      m.move();
      m.displayAnita();
    }
  }
}

