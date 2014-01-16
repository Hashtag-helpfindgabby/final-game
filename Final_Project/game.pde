mario m;
Lion[] lions = new Lion[25];
boolean start, stop;
PImage optc, opta;
PImage startHere;
boolean goC, goA;
int level;
PImage l0;
int index = 1;
void setup() {
  background(0);
  startHere =loadImage("background.jpg");
  size(startHere.width, startHere.height);
  optc = loadImage("caitlin.png");
  opta = loadImage("anita.png");
  start= true;
  m = new mario();
  goC=false;
  goA=false;
  level = 0;
  l0 = loadImage("Jungle .jpg");
  for (int i=0; i<lions.length; i++) {
    lions[i] = new Lion();
  }
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
      //if you click, you go to the first level of the game
      start= true;
      stop = true;
      level+=1;
    }
  }
  if (start == true && stop == true) {
    if (level==1) {
      image(l0, 0, 0, startHere.width, startHere.height);
    }
    fill(255, 0, 0);
    text(level, 50, 50);
    if (mousePressed && mouseX>75 && mouseX<75+200 
      && mouseY>220 && mouseY<220+250) {
      goC = true;
    }
    if (mousePressed && mouseX>520 && mouseX<520+200 
      && mouseY>220 && mouseY<220+250) {
      goA=true;
    }
    if (goC==true || goA == true) {
      m.move();
      m.jump();
    }
    if (goC==true) {
      m.displayCaitlin();
    }
    if (goA==true) {
      m.displayAnita();
    }
    if (m.loc.x>width-m.s) {
      level++;
      m.loc.set(0, height/2);
      //if you get to the end of the screen you move to the next level
    }
    if(level==1) {
      for (int i=0;i<index;i++) {
        //declares lion class
        lions[i].display();
        lions[i].fall();
        if(i==25) {
          i=0;
        }
        if (m.checkRunner(lions[i]) == true) {
          //if the lion touches the runner, you start over
          start=true;
          start=false;
          level=0;
        }
      }
    }  
  }
}

