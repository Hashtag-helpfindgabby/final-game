boolean start;
boolean stop;
PImage startHere;
PImage optc, opta;

void setup() {
  background(0);
  startHere = loadImage("background.jpg");
  size(startHere.width, startHere.height);
  optc = loadImage("caitlin.jpg");
  opta = loadImage("anita.jpg");
  start = true;
}

void draw() {
  if (start == true && stop == false) {
    background(startHere);
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
  }
}
