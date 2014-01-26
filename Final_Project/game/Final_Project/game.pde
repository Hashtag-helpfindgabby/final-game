mario m;
Timer timer;
Lion[] lions = new Lion[25];
Obstacle[] obstacles = new Obstacle[25];
boolean start, stop;
PImage optc, opta;
PImage startHere, story2, story3, story4, story5, cliff, endHere;
boolean goC, goA;
int level;
PImage l0;
int index = 15;
int index2 = 5;

void setup() {
  story2 = loadImage("runfromlions.jpg");
  story3 = loadImage("story 2.png");
  story4 = loadImage("story 3.png");
  story5 = loadImage("end.jpg");
  cliff = loadImage("cliff.png");
  endHere = loadImage("winner.jpg");
  background(0);
  timer = new Timer(10000);
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
  for (int z=0; z<obstacles.length;z++) {
    obstacles[z] = new Obstacle();
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
    if (m.loc.x>width-m.d) {
      level++;
      m.loc.set(0, height/2);
      //if you get to the end of the screen you move to the next level
    }
    if (level==1) {
      //where are the other levels?? then we just have to repeat the timer for the different levels i think 
      for (int i=0;i<index;i++) {
        //declares lion class
        lions[i].display();
        lions[i].fall();
        if (m.checkRunnerL(lions[i]) == true) {
          //if the lion touches the runner, you start over
          stop=false;
          level=0;
          lions[i].reset();
          //when the levels over
          timer.start();
        }
        if (timer.isFinished()) {
          background(story2);
          //make it so that it goes to the next level
      }

      for (int z=0; z<index2;z++) {
        obstacles[z] = new Obstacle();
        obstacles[z].display();
        m.checkRunnerO(obstacles[z]);
      }
    }
  }
}
