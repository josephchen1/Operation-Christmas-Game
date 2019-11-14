PImage startscreen;
PImage ground;
PImage ground2;
PImage ground3;
int level;
Player john = new Player(800, 500, 1, 100);
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Zombie> zombies = new ArrayList<Zombie> ();
ArrayList<Barrel> barrels = new ArrayList<Barrel>();
float x = 500;
float y = 500;
boolean shootdelay = false;
int killcount=0;

Snow[] flakes = new Snow[300];

void setup() {
  level = -1;
  fullScreen();
  //size(1200,800);
  startscreen = loadImage("santa.jpg");
  image(startscreen, 0, 0, width, height);

  
    for (int i = 0; i<flakes.length; i++) { 
    flakes[i] = new Snow(random(2, 10));
    flakes[i].spreadY(i);
  }
  
}

void mouseReleased() {
  shootdelay=true;
}

void draw() {
  for (int x = 0; x<projectiles.size(); x++) {
      for (int y = 0; y<zombies.size(); y++) {
        float distance_x = zombies.get(y).x - projectiles.get(x).x;
        float distance_y = zombies.get(y).y - projectiles.get(x).y;
        float distance = sqrt(distance_x * distance_x + distance_y * distance_y);
          if (distance < (zombies.get(y).radius/2 + 10)) {
            zombies.remove(y);
            killcount ++;
          }
        }
    }
  for (int x = 0; x<projectiles.size(); x++) {
      for (int y = 0; y<barrels.size(); y++) {
        float distance_x = barrels.get(y).x - projectiles.get(x).x;
        float distance_y = barrels.get(y).y - projectiles.get(x).y;
        float distance = sqrt(distance_x * distance_x + distance_y * distance_y);
          if (distance < (25 + 10)) {
            barrels.get(y).explode(barrels.get(y).x, barrels.get(y).y);
            barrels.remove(y);
          }
        }
    }
  
  if (mousePressed==true && mouseX>width-30 && mouseX<width && mouseY>0 && mouseY<30) {
    System.out.println("true");
    level = -1;
    background (0);
    fullScreen();
    startscreen = loadImage("santa.jpg");
    image(startscreen, 0, 0, width, height);
  }
  

  
  if (level==-1) {

    background(0);
      //startscreen = loadImage("santa.jpg");
      //image(startscreen, 0, 0, width, height);
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
    
    for (int i = 0; i < flakes.length; i++) {
    flakes[i] .display();
  if (flakes[i].x > 280 && flakes[i].y >445 && flakes[i].x<400){
    flakes[i].bounce();  
  }
    }
  
  
    // if key is pressed, then it goes into game
    if (mouseX>225 && mouseX<975 && mouseY>435 && mouseY<535 && mousePressed==true) {
      level=0;
    }
    if (mouseX>225 && mouseX<975 && mouseY>535 && mouseY<635 && mousePressed==true) {
      level=9;
    }
    if (mouseX>225 && mouseX<975 && mouseY>635 && mouseY<735 && mousePressed==true) {
      level=19;
    }
  }
if (level>-1){
for(int l = 0;l<100;l++){
  if (level==l) {
    if (zombies.size()==0) {
      level+=1;
      for (int i= 0;i<level; i++){ //Creates 5l enemies
         zombies.add(new Zombie(random(0,100), random(height), 1, 1, 100));}
      for (int x= 0;x<level; x++){ //Creates 5l enemies
         zombies.add(new Zombie(random(width-100,width), random(height), 1, 1, 100));}
      for (int j= 0;j<level; j++){ //Creates 5l enemies
         zombies.add(new Zombie(random(width), random(height-100,height), 1, 1, 100));}
      for (int k= 0;k<level; k++){ //Creates 5l enemies
         zombies.add(new Zombie(random(width), random(0,100), 1, 1, 100));}
    }
    if (barrels.size()==0) {
      for (int b = 0; b<5; b++) {
        barrels.add(new Barrel(random(width),random(height),50));
      }
    }
    
    background(255,255,255);
    fill(255,0 ,0);
    john.play();
    text("killcount:"+killcount,100,150);
    text("Level:"+level,100,250);
    } 
}
}
}
