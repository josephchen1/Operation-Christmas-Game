PImage startscreen;
PImage ground;
PImage ground2;
PImage ground3;
int level;
Player john = new Player(800, 500, 1, 100);
ArrayList<Projectile> projectiles;
ArrayList<Zombie> zombies = new ArrayList<Zombie> (255);
float x = 500;
float y = 500;


void setup() {

  projectiles = new ArrayList<Projectile>();
  // level is set to 1
  level = 1;
  fullScreen();
  // loading image from file
  startscreen = loadImage("zombiebackground.jpg");
  // loading image to screen
  image(startscreen, 0, 0, width, height);
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
    if (zombies.size()==0) {
      for (int i= 0;i<10; i++){ //Creates 10 enemies
         zombies.add(new Zombie(random(0,100), random(height), 1, 1, 100));}
      for (int x= 0;x<10; x++){ //Creates 10 enemies
         zombies.add(new Zombie(random(width-100,width), random(height), 1, 1, 100));}
      for (int j= 0;j<10; j++){ //Creates 10 enemies
         zombies.add(new Zombie(random(width), random(height-100,height), 1, 1, 100));}
      for (int k= 0;k<10; k++){ //Creates 10 enemies
         zombies.add(new Zombie(random(width), random(0,100), 1, 1, 100));}
    }
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
