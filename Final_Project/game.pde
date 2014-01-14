mario m;
boolean start, stop;
PImage optc, opta;
<<<<<<< HEAD:Final_Project/game/game.pde
PImage story1, startHere;
int oldTime = 0;
int currentTime = 0;
int timeChange = 0;

=======
PImage startHere;
boolean goC, goA;
int level;
>>>>>>> origin/Arlene:Final_Project/game.pde
void setup() {
  story1 = loadImage("story 1.png");
  startHere =loadImage("background.jpg");
<<<<<<< HEAD:Final_Project/game/game.pde
  size(startHere.width, startHere.height);
  background(0);
  optc = loadImage("caitlin.png");
  opta = loadImage("anita.png");
  start= false;
  stop = true;
=======
  size(startHere.width,startHere.height);
  optc = loadImage("caitlin.png");
  opta = loadImage("anita.png");
  start= true;
>>>>>>> origin/Arlene:Final_Project/game.pde
  m = new mario();
  goC=false;
  goA=false;
  level = 0;
}
void draw() {
  background(story1);
  currentTime = millis();
  timeChange = currentTime - oldTime;
  if (timeChange >= 10000) {
    start = true;
    stop = false;
  }
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
      level+=1;
    }
  }
  if (start == true && stop == true) {
    background(0);
    fill(255,0,0);
    text(level,50,50);
    if (mousePressed && mouseX>75 && mouseX<75+200 
      && mouseY>220 && mouseY<220+250) {
      goC = true;
    }
    if (mousePressed && mouseX>520 && mouseX<520+200 
      && mouseY>220 && mouseY<220+250) {
      goA=true;
    }
    if(goC==true || goA == true) {
      m.move();
      m.jump();
    }
    if (goC==true) {
      m.displayCaitlin(); 
    }
    if(goA==true) {
      m.displayAnita();
    }
    if(m.loc.x>width-m.s) {
      level++;
      m.loc.set(0,height/2);
    }
  }
}

