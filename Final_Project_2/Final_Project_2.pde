Mario m;
Obstacle o;
Lion[] lions = new Lion[25];
Fireballs[] fireball = new Fireballs[25];
Pearl[] pearls = new Pearl[30];
PImage optc, opta;
PImage startHere, intro, story1, story2, story3, story, end, cliff, winner;
boolean goC, goA;
boolean startscreen = true;
boolean introstory = false;
boolean level1pic = false;
boolean level2pic = false;
boolean level3pic = false;
boolean winnerpic = false;
boolean cliffpic = false;
boolean endpic = false;
boolean level1 = false;
boolean level2 = false;
boolean level3 = false;
boolean level1end = false;
boolean level2end = false;
boolean level3end = false;
boolean goCaitlin = false;
int level;
PImage l1, l2, l3;
int index = 1;
int index2 = 1;
int index3 = 3;
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

  m = new Mario();
  o = new Obstacle();
  level = 0;
  l1 = loadImage("Jungle .jpg");
  l2 = loadImage("ocean.jpg");
  l3 = loadImage("hell.jpg");
  intro= loadImage("story 1.jpg");
  story1 = loadImage("runfromlions.jpg");
  story2 = loadImage("story 2.jpg");
  story3 = loadImage("story 3.jpg");
  end = loadImage("end.jpg");
  winner = loadImage("winner.jpg");
  cliff = loadImage("cliff.jpg");
  for (int i=0; i<lions.length; i++) {
    lions[i] = new Lion();
  }
  for (int k=1; k<pearls.length; k++) {
    pearls[k] = new Pearl();
  }
  for ( int q=0; q<fireball.length; q++) {
    fireball[q] = new Fireballs();
  }
}

void draw() {
  //Create the startscreen
  if (startscreen==true) {
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
    if (mousePressed && mouseX>75 && mouseX<75+200 
      && mouseY>220 && mouseY<220+250) {
      //If you click on Caitlin, she is displayed for the rest of the game
      //start screen goes away
      //introstory starts
      goCaitlin = true;
      introstory = true;
      startscreen = false;
    }
    if (mousePressed && mouseX>520 && mouseX<520+200 
      && mouseY>220 && mouseY<220+250) {
      //if you click on Anita she is displayed for the rest of the game
      //introstory starts
      //startscreen is gone
      introstory = true;
      startscreen = false;
    }
  }
  if (introstory==true) {
    image(intro, 0, 0, startHere.width, startHere.height);
  }
  if (level1pic==true) {
    image(story1, 0, 0, startHere.width, startHere.height);
  }
  if (level1==true) {
    image(l1, 0, 0, startHere.width, startHere.height);
    goRunner();
    threshold=1000;
    if (millis() - lionTime > threshold) { 
      if (index< lions.length) {
        //timer to limit the lions coming out at once
        index++;
        lionTime = millis();
        //if the difference b/w milli and lionTime is greater than threshold, then one lion goes
      }
    }
    for (int i=0;i<index;i++) {
      //Declares lion class
      lions[i].display();
      lions[i].editloc();
      lions[i].fall();
      o.display1();
      m.checkRunnerO(o);
      o.display2();
      m.checkRunnerO(o);
      o.display3();
      m.checkRunnerO(o);

      if (m.checkRunnerL(lions[i]) == true) {
        //if the lion touches the runner, you start over
        startscreen=true;
        m.loc.set(0, height/2);
        index=1;
        i=0;
        level1=false;
      }
      if (m.loc.x>width-m.d) {
        lions[i].done();
        index=1;
        i=0;
        m.loc.set(0, height*3/4);
        level2pic=true;
        level1=false;
      }
    }
  }
  if (level2pic==true) {
    //Show the story after level 1 is complete
    image(story2, 0, 0, startHere.width, startHere.height);
  }
  if (level2==true) {
    image(l2, 0, 0, startHere.width, startHere.height);
    goRunner();
    fill(255, 0, 255);
    textSize(50);
    text(p, 50, 100);
    if (millis() - lionTime > threshold) { 
      if (index2< pearls.length) {
        //timer to limit the pearls coming down at once
        //uses the same timer as the lions
        index2++;
        lionTime = millis();
      }
    }
    for (int k=1; k<index2; k++) {
      //display pearls and they fall
      pearls[k].display();
      pearls[k].fall();
      if (k==30) {
        k=0;
      }
      if (m.checkRunnerP (pearls[k]) == true) {
        //if a  pearl falls through the runner, it goes away and the score increases
        pearls[k].goAway();
        p++;
      }
      if (p==10) {
        m.loc.set(0, height/2);
        level3pic=true;
        p=0;
        k=0;
        level2=false;
      }
    }
  }
  if (level3pic==true) {
    image(story3, 0, 0, startHere.width, startHere.height);
  }

  if (level3==true) {
    image(l3, 0, 0, startHere.width, startHere.height);
    goRunner();
    threshold=3000;
    if (millis() - lionTime > threshold) { 
      if (index3< fireball.length) {
        //timer to limit the fireballs coming out at once
        //uses same timer as previous levels
        index3++;
        lionTime = millis();
      }
    }
    for (int q=0; q<index3; q++) {
      fireball[q].display();
      fireball[q].move();
      fireball[q].bounce();
      if (q==25) {
        q=0;
      }
      //declare fireballs
      if (m.checkRunnerF(fireball[q]) == true) {
        //if the runner hits a fireball, back to start
        fireball[q].reset();
        q=0;
        index=3;
        startscreen=true;
        goCaitlin=false;
        level3=false;
      }
      if (m.loc.x>width-m.d/2) {
        winnerpic=true;
        goCaitlin=false;
        index=3;
        level3=false;
      }
    }
  }
  if (winnerpic==true) {
    image(winner, 0, 0, startHere.width, startHere.height);
  }
  if (endpic==true) {
    image(end, 0, 0, startHere.width, startHere.height);
  }
  if (cliffpic==true) {
    image(cliff, 0, 0, startHere.width, startHere.height);
  }
}


void keyPressed() {
  //When key is pressed, it should move from one story onto the next level 
  if (key == ' ') {

    if (introstory==true) {
      level1pic=true;
      introstory=false;
    }
    else {

      if (level1pic==true) {
        level3=true;
        level1pic=false;
      }
      if (level2pic==true) {
        level2=true;
        level2pic=false;
      }
      if (level3pic==true) {
        level3=true;
        level3pic=false;
      }
      if (winnerpic==true) {
        endpic=true;
        winnerpic=false;
      }
      else { 
        if (endpic==true) {
          cliffpic=true;
          endpic=false;
        }
        else if (cliffpic==true) {
          startscreen=true;
          cliffpic=false;
        }
      }
    }
  }
}



void goRunner() {
  if (goCaitlin == true) {
    m.displayCaitlin();
    m.move();
    m.jump();
  }
  else {
    m.displayAnita();
    m.move();
    m.jump();
  }
}

