mario m;
boolean start, stop;
PImage optc, opta;
PImage story1, startHere;
int oldTime = 0;
int currentTime = 0;
int timeChange = 0;

void setup() {
  background(0);
  story1 = loadImage("story 1.png");
  size(story1.width, story1.height);
  background(story1);
  startHere =loadImage("background.jpg");
  optc = loadImage("caitlin.png");
  opta = loadImage("anita.png");
  start= false;
  stop = true;
  m = new mario();
}
void draw() {
  currentTime = millis();
  timeChange = currentTime - oldTime;
  if (timeChange >= 8000) {
    start = true;
    stop = false;
  }
  if (start == true && stop == false) {
    //start screen
    background(0);
    image(startHere,0,0);
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
    if (mousePressed && mouseX>75 && mouseX<75+200 
      && mouseY>220 && mouseY<220+250) {
      m.displayCaitlin();
    }
    if (mousePressed && mouseX>520 && mouseX<520+200 
      && mouseY>220 && mouseY<220+250) {
      m.displayAnita();
    }
    m.move();
  }
}

