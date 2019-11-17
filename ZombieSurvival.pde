PImage startscreen;
PImage ground;
PImage ground2;
PImage ground3;
boolean up, down, left, right;
int level;
Player john = new Player(800, 500, 3, 100);
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Zombie> zombies = new ArrayList<Zombie> ();
ArrayList<Barrel> barrels = new ArrayList<Barrel>();
ArrayList<AmmoCrate> crates = new ArrayList<AmmoCrate>();
float x = 500;
float y = 500;
boolean shootdelay = false;
int killcount=0;
int ammoreload = 0;

Snow[] flakes = new Snow[300];
void setup() {
  level = -1;
  size(1200, 800);
  startscreen = loadImage("santa.jpg");
  for (int i = 0; i<flakes.length; i++) { 
    flakes[i] = new Snow(random(2, 10));
    flakes[i].spreadY(i);
  }
}
void keyPressed() {//movement in direction is true until key released
  if (key=='w'||key=='W') {
    up = true;
  }
  if (key=='a'||key=='A') {
    left = true;
  }
  if (key=='s'||key=='S') {
    down = true;
  } 
  if (key=='d'||key=='D') {
    right = true;
  }
}

void keyReleased() {
  if (key=='w'||key=='W') {
    up = false;
  }
  if (key=='a'||key=='A') {
    left = false;
  }
  if (key=='s'||key=='S') {
    down = false;
  } 
  if (key=='d'||key=='D') {
    right = false;
  }
}
void mouseReleased() {
  shootdelay=true;
}

void draw() {
  for (int x = 0; x<projectiles.size(); x++) {//projectile collision with zombies
    for (int y = 0; y<zombies.size(); y++) {
      float distance_x = zombies.get(y).x - projectiles.get(x).x;
      float distance_y = zombies.get(y).y - projectiles.get(x).y;
      float distance = sqrt(distance_x * distance_x + distance_y * distance_y);
      if (distance < (zombies.get(y).radius/2 + projectiles.get(x).size/2)) {
        zombies.remove(y);
        killcount ++;
      }
    }
  }
  for (int x = 0; x<projectiles.size(); x++) {//projectile collision with barrels
    for (int y = 0; y<barrels.size(); y++) {
      float distance_x = barrels.get(y).x - projectiles.get(x).x;
      float distance_y = barrels.get(y).y - projectiles.get(x).y;
      float distance = sqrt(distance_x * distance_x + distance_y * distance_y);
      if (distance < (barrels.get(y).radius/2 + projectiles.get(x).size/2)) {
        barrels.get(y).explode(barrels.get(y).x, barrels.get(y).y);
        barrels.remove(y);
      }
    }
  }
  for (int i = 0; i<crates.size(); i++) {//player gets ammo if overlapping with crate and crate disapears
    if (john.overlap(crates.get(i))) {
      john.ammo+=10;
      crates.remove(i);
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
    background(startscreen);
    //startscreen = loadImage("santa.jpg");
    //image(startscreen, 0, 0, width, height);
    textSize(50);
    textAlign(CENTER);
    fill(0, 0, 0);
    rectMode(CENTER);
    fill(200, 200);
    rect(600, 485, 750, 100);
    rect(600, 585, 750, 100);
    rect(600, 685, 750, 100);
    fill(0, 0, 0);
    text("ZOMBIE SURVIVAL", 600, 400);
    text("EASY MODE", 600, 500);
    text("MEDIUM MODE", 600, 600);
    text("HARD MODE", 600, 700);

    for (int i = 0; i < flakes.length; i++) {
      flakes[i] .display();
      if (flakes[i].x > 280 && flakes[i].y >445 && flakes[i].x<400) {
        flakes[i].bounce();
      }
    }

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
  if (level>-1) {
    for (int l = 0; l<100; l++) {
      if (level==l) {
        if (zombies.size()==0&&john.health>0) {
          crates.clear();
          barrels.clear();
          projectiles.clear();
          for (int c = 0; c<5; c++) {
            crates.add(new AmmoCrate(random(width), random(height)));
          }
          for (int b = 0; b<5; b++) {
            barrels.add(new Barrel(random(width), random(height), 50));
          }
          level+=1;
          for (int i= 0; i<level; i++) { //Creates 5l enemies
            zombies.add(new Zombie(random(-100, 0), random(height), random(1+0.1*level,3+0.1*level)));
          }
          for (int x= 0; x<level; x++) { //Creates 5l enemies
            zombies.add(new Zombie(random(width+100, width), random(height), random(1+0.1*level,3+0.1*level)));
          }
          for (int j= 0; j<level; j++) { //Creates 5l enemies
            zombies.add(new Zombie(random(width), random(height+100, height), random(1+0.1*level,3+0.1*level)));
          }
          for (int k= 0; k<level; k++) { //Creates 5l enemies
            zombies.add(new Zombie(random(width), random(-100, 0), random(1+0.1*level,3+0.1*level)));
          }
        }

        background(255, 255, 255);
        fill(255, 0, 0);
        john.play();
        if (john.health<=0) {
          zombies.clear();
          crates.clear();
          barrels.clear();
        }
        text("Kill Count: "+killcount, 80, 150);
        text("Level: "+level, 80, 250);
      }
    }
  }
}
