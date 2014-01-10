mario m;
void setup() {
  size(500,500);
  m = new mario();
}
void draw() {
  background(0);
  if(mousePressed && //click on caitlin) {
    m.displayCaitlin;
  }
  if(mousePressed && //click on anita) {
    m.displayAnita;
  }
  
