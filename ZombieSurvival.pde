// input startscreen background impace
PImage startscreen;
// input ground background image for game
PImage ground;
PImage ground2;
PImage ground3;
// create level system
int level;
Player john = new Player(random(width+100,width-100), random(height+100,height-100), 1, 100);
ArrayList<Projectile> projectiles;
float x = 500;
float y = 500;

void setup() {
  frameRate(30);
  projectiles = new ArrayList<Projectile>();
  frameRate (30);
  // level is set to 1
  level = 1;
  fullScreen();
  // loading image from file
  startscreen = loadImage("zombiebackground.jpg");
  // loading image to screen
  image(startscreen, 0, 0, width, height);
  ArrayList<zombie> zombies = new ArrayList<zombie>(255);
       for (int i= 0;i<25; i++){ //Creates 25 enemies
         zombies.add(new zombie(100, 100, 1, 1, 100));
}
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
  }

  if (level==2) {
    background(0,0,0);
    // loading an image to variable ground
    ground = loadImage("land.jpg");
    // loading image "ground" into game
    image(ground, 0, 0, width, height);
    Barrel jo = new Barrel(500,500,100);
    jo.display();
    fill(255,0,0);
    john.display();
    john.move();
    john.shoot();
    }
  
  
  
  if (level==10) {
      background(0,0,0);
      ground2 = loadImage("bg1.jpg");
      image(ground2, 0, 0, width, height);
  }
    
  if (level==20) {
      background(255,120,120);
      ground3 = loadImage("bg2.jpg");
      image(ground3, 0, 0, width, height);
  }
}
