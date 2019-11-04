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
    text("Press any key to start game",600,500);
    // if key is pressed, then it goes into game
    if (keyPressed == true) {
      level = 2;
    }
    // into game
    if (level==2) {
    background(0,0,0);
    // loading an image to variable ground
    ground = loadImage("land.jpg");
    // loading image "ground" into game
    image(ground, 0, 0, 1200, 800);
    }
  }
}
