mario m;
Timer timer;
Obstacle o;
Lion[] lions = new Lion[25];
Fireballs[] fireball = new Fireballs[25];
Pearl[] pearls = new Pearl[20];
boolean start, stop;
PImage optc, opta;
PImage startHere, story2, story3, story4, story5, cliff, endHere;
boolean goC, goA;
int level;
PImage l1, l2, l3;
int index = 1;
int index2 = 5;
int index3 = 10;
int index4 = 1;
int threshold = 1000;
int lionTime = 0;
int pearlTime = 0;
int p = 0;
void setup() {
  background(0);
  startHere =loadImage("background.jpg");
  size(startHere.width, startHere.height);
  optc = loadImage("caitlin.png");
  opta = loadImage("anita.png");
  start= true;
  m = new mario();
  o = new Obstacle();
  goC=false;
  goA=false;
  level = 0;
  l1 = loadImage("Jungle .jpg");
  l2 = loadImage("ocean.jpg");
  l3 = loadImage("hell.jpg");
  story2 = loadImage("runfromlions.jpg");
  story3 = loadImage("story 2.png");
  story4 = loadImage("story 3.png");
  story5 = loadImage("end.jpg");
  cliff = loadImage("cliff.png");
  endHere = loadImage("winner.jpg");
  for (int i=0; i<lions.length; i++) {
    lions[i] = new Lion();
  }
  for ( int q=0; q<fireball.length; q++) {
    fireball[q] = new Fireballs();
  }
  for (int k=1; k<pearls.length; k++) {
    pearls[k] = new Pearl();
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
      image(l1, 0, 0, startHere.width, startHere.height);
    }
    if (level==2) {
      image(l2, 0, 0, startHere.width, startHere.height);
    }
    if (level == 3) {
      image(l3, 0, 0, startHere.width, startHere.height);
    }
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
  }
  if (level==1) {
    if (millis() - lionTime > threshold) { 
      if (index< lions.length) {
        //timer to limit the lions coming out at once
        index++;
        lionTime = millis();
        //if the difference b/w milli and lionTime is greater than threshold, then one lion goes
      }
    }
    for (int i=0;i<index;i++) {
      //declares lion class
      lions[i].display();
      lions[i].fall();
      o.display1();
      o.display2();
      o.display3();
      m.checkRunnerO(o);


      if (m.checkRunnerL(lions[i]) == true) {
        //if the lion touches the runner, you start over
        stop=false;
        level=0;
        m.loc.set(0, height/2);
        index=1;
      }

      if (m.loc.x>width-m.d) {
        lions[i].done();
        m.loc.set(0, height*3/4);
        background(story3);
        timer = new Timer(10000);
        timer.start();
        if(timer.isFinished()) {
          level++;
        }
      }
    }
  }

  if (level==2) {
    fill(255, 0, 255);
    textSize(50);
    text(p, 50, 100);
    if (millis() - lionTime > threshold) { 
      if (index4< pearls.length) {
        //timer to limit the pearls coming down at once
        //uses the same timer as the lions
        index4++;
        lionTime = millis();
      }
    }
    for (int k=1; k<index4; k++) {
      //display pearls and they fall
      pearls[k].display();
      pearls[k].fall();
      if (k==15) {
        k=0;
      }
      if (m.checkRunnerP (pearls[k]) == true) {
        //if a  pearl falls through the runner, it goes away and the score increases
        pearls[k].goAway();
        threshold-=100;
        p++;
      }
      if (p==15) {
        level++;
      }
    }
  }

  if (level==3) {
    for ( int q=0; q<index3; q++) {
      fireball[q] = new Fireballs();
      //declare fireballs
      if (m.checkRunnerF(fireball[q]) == true) {
        //if the runner hits a fireball, back to start
        stop = false;
        level = 0;
        fireball[q].reset();
      }
    }
  }
}

