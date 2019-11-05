// input startscreen background impace
PImage startscreen;
// input ground background image for game
PImage ground;
// create level system
int level;

void setup() {
  // level is set to 1
  level = 1;
  size(1200, 800);
  // loading image from file
  startscreen = loadImage("zombiebackground.jpg");
  // loading image to screen
  image(startscreen, 0, 0, 1200, 800);

}

void draw() {
  // start menu
  if (level==1) {
    textSize(50);
    textAlign(CENTER);
    text("ZOMBIE SURVIVAL",600,400);
    text("Click here for EASY MODE",600,500);
    text("Click here for MEDIUM MODE",600,600);
    text("Click here for HARD MODE",600,700);
    rectMode(CENTER);
    fill(255, 0);
    rect(600,485,750,100);
    rect(600,585,750,100);
    rect(600,685,750,100);
    // if key is pressed, then it goes into game
    if (mouseX>225 && mouseX<975 && mouseY>435 && mouseY<535 && mousePressed==true) {
      level=2;
    }
    if (mouseX>225 && mouseX<975 && mouseY>535 && mouseY<635 && mousePressed==true) {
      level=10;
    }
    if (mouseX>225 && mouseX<975 && mouseY>635 && mouseY<735 && mousePressed==true) {
      level=20;
    }
    // into game
    if (level==2) {
    background(0,0,0);
    // loading an image to variable ground
    ground = loadImage("land.jpg");
    // loading image "ground" into game
    image(ground, 0, 0, 1200, 800);
    }
    if (level==10) {
      background(0,0,0);
    }
    if (level==20) {
      background(255,120,120);
    }
  }
}
