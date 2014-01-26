class Timer {
  PImage story2, story3, story4, story5, cliff, endHere;
  int oldTime = 0;
  int currentTime = 0;
  int timeChange = 0;
  
  void setup() {
    story2 = loadImage("runfromlions.jpg");
    story3 = loadImage("story 2.png");
    story4 = loadImage("story 3.png");
    story5 = loadImage("end.jpg");
    cliff = loadImage("cliff.png");
    endHere = loadImage("winner.jpg");
    Timer() {
      
