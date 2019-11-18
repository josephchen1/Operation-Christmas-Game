PImage grinch1;
PImage original;
PImage grinch2;
PImage grinch3;
PImage grinch4;
boolean pic1 = false;
boolean pic2 = false;  
boolean pic3 = false;
PImage ground;
PImage ground2;
PImage ground3;
boolean up, down, left, right;
int level;
Player john = new Player(800, 500, 3, 100);
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Grinch> grinches = new ArrayList<Grinch> ();
ArrayList<Barrel> barrels = new ArrayList<Barrel>();
ArrayList<AmmoCrate> crates = new ArrayList<AmmoCrate>();
float x = 500;
float y = 500;
boolean shootdelay = false;
int killcount=0;
int highscore=0;
int ammoreload = 0;
int MAX = 80;
PImage expl;
//import processing.sound.*;
//SoundFile meanone;
Snow[] flakes = new Snow[300];

void setup() {
  //meanone = new SoundFile(this, "meanone.mp3");
  //meanone.play();
  level = -1;
  size(1080, 720);
  grinch1 = loadImage("grinch1.png");
  grinch2 = loadImage("grinch2.png");
  grinch3 = loadImage("grinch3.png");
  grinch4 = loadImage("grinch4.png");
  original = loadImage("grinch1.png");
  for (int i = 0; i<flakes.length; i++) { 
    flakes[i] = new Snow(random(2, 10));
    flakes[i].spreadY(i);
  }
}
void keyPressed() {
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
  if (killcount>highscore) {
    highscore = killcount;
  }
  if (john.energy < 100) {
    john.energy += 0.01;
  }
  background (0);

  for (int x = 0; x<projectiles.size(); x++) {
    for (int y = 0; y<grinches.size(); y++) {
      float distance_x = grinches.get(y).x - projectiles.get(x).x;
      float distance_y = grinches.get(y).y - projectiles.get(x).y;
      float distance = sqrt(distance_x * distance_x + distance_y * distance_y);
      if (distance < (grinches.get(y).radius/2 + projectiles.get(x).size/2)) {
        grinches.remove(y);
        killcount ++;
        john.money++;
      }
    }
  }
  for (int x = 0; x<projectiles.size(); x++) {
    for (int y = 0; y<barrels.size(); y++) {
      float distance_x = barrels.get(y).x - projectiles.get(x).x;
      float distance_y = barrels.get(y).y - projectiles.get(x).y;
      float distance = sqrt(distance_x * distance_x + distance_y * distance_y);
      if (distance < (barrels.get(y).radius/2 + projectiles.get(x).size/2)) {
        background(0);
        barrels.get(y).explode(barrels.get(y).x, barrels.get(y).y);
        barrels.remove(y);
      }
    }
  }
  for (int i = 0; i<crates.size(); i++) {
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
    grinch1 = loadImage("grinch1.png");
    grinch2 = loadImage("grinch2.png");
    grinch3 = loadImage("grinch3.png");
    grinch4 = loadImage("grinch4.png");
    image(grinch1, 0, 0, width, height);
    image(grinch2, 0, 0, width, height);
    image(grinch3, 0, 0, width, height);
    image(grinch4, 0, 0, width, height);
  }



  if (level==-1) {

    background(0);
    background(grinch1);
    fill(100, 100, 100, 100);


    //startscreen = loadImage("santa.png");
    //image(startscreen, 0, 0, width, height);

    for (int i = 0; i < flakes.length; i++) {
      flakes[i] .display();
      if (flakes[i].x > 280 && flakes[i].y >445 && flakes[i].x<400) {
        flakes[i].bounce();
      }
    }

    if (mouseX>70 && mouseX<380 && mouseY>430 && mouseY<485) {
      grinch1=grinch2;
    } else {
      grinch1=original;
    }

    if (mouseX>70 && mouseX<380 && mouseY>430 && mouseY<485 && mousePressed ==true) {
      level = 0;
    }

    //------------------------------------------------------------------------------------------

    if (mouseX>70 && mouseX<500 && mouseY>492 && mouseY<554) {
      grinch1=grinch3;
    }

    if (mouseX>70 && mouseX<500 && mouseY>492 && mouseY<554 && mousePressed ==true) {
      level = 9;
    }

    //------------------------------------------------------------------------------------------

    if (mouseX>70 && mouseX<380 && mouseY>544 && mouseY<606) {
      grinch1=grinch4;
    }

    if (mouseX>70 && mouseX<380 && mouseY>544 && mouseY<606 && mousePressed ==true) {
      level = 19;
    }
  }

  //------------------------------------------------------------------------------------------


  if (level>-1) {
    for (int l = 0; l<100; l++) {
      if (level==l) {
        if (grinches.size()==0&&john.health>0) {
          crates.clear();
          barrels.clear();
          projectiles.clear();
          int spawnrate = (int)(level*0.3);
          for (int c = 0; c<1+spawnrate; c++) {
            crates.add(new AmmoCrate(random(width), random(height)));
          }
          for (int b = 0; b<1+spawnrate; b++) {
            barrels.add(new Barrel(random(width), random(height), 50));
          }
          level+=1;
          for (int i= 0; i<level; i++) { //Creates 5l enemies
            grinches.add(new Grinch(random(-100, 0), random(height), random(1+0.1*level, 3+0.1*level)));
          }
          for (int x= 0; x<level; x++) { //Creates 5l enemies
            grinches.add(new Grinch(random(width+100, width), random(height), random(1+0.1*level, 3+0.1*level)));
          }
          for (int j= 0; j<level; j++) { //Creates 5l enemies
            grinches.add(new Grinch(random(width), random(height+100, height), random(1+0.1*level, 3+0.1*level)));
          }
          for (int k= 0; k<level; k++) { //Creates 5l enemies
            grinches.add(new Grinch(random(width), random(-100, 0), random(1+0.1*level, 3+0.1*level)));
          }
        }

        background(255, 255, 255);
        fill(255, 0, 0);
        john.play();
        if (john.health<=0) {
          grinches.clear();
          crates.clear();
          barrels.clear();
        }
        textAlign(LEFT);
        text("Health: "+john.health, 20, 50);//health bar
        text("Ammo: "+john.ammo, 20, 100);
        text("Energy: "+(int)john.energy, 20, 150);
        textAlign(CENTER);
        textSize(30);
        text("Level: "+level, width/2, 50);
        textSize(20);
        textAlign(RIGHT);
        text("Kill Count: "+killcount, width-20, 50);
        text("Money: "+john.money, width-20, 100);
        text("Bullet Upgrade: "+john.bulletupgrade, width-20, 150);
        text("Speed Upgrade: "+john.speedupgrade, width-20, 200);
      }
    }
  }
}
