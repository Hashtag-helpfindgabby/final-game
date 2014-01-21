class Timer {
  PImage story2, story3, story4, story5, cliff, endHere;
  int oldTime = 0;
  int currentTime = 0;
  int timeChange = 0;
  
  void setup() {
    story2 = loadImage("story 2.png");
    story3 = loadImage("story 1.png");
    story4 = loadImage("story 1.png");
    story5 = loadImage("story 1.png");
    cliff = loadImage("story 1.png");
    endHere = loadImage("story 1.png");
