void draw() {
  //Create start Screen
  if (start == true && stop == false) {
    rectMode(CENTER);
    fill(163, 90, 242);
    rect(width/2, height/2, 200, 70);
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    textSize(60);
    fill(255);
    text("Start!", width/2, height/2);
    imageMode(CENTER);
    image(lady, 65, 245, 75, 100);
  }

