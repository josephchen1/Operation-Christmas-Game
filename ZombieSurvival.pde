PImage startscreen;
PImage ground;
PImage ground2;
PImage ground3;
int level;
Player john = new Player(800, 500, 5, 100);
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Zombie> zombies = new ArrayList<Zombie> ();
ArrayList<Barrel> barrels = new ArrayList<Barrel>();
float x = 500;
float y = 500;

Snow[] flakes = new Snow[300];

void setup() {
  level = 1;
  //fullScreen();
  size(1200,800);
  startscreen = loadImage("santa.jpg");
  image(startscreen, 0, 0, width, height);
  
    for (int i = 0; i<flakes.length; i++) { 
    flakes[i] = new Snow(random(2, 10));
    flakes[i].spreadY(i);
  }
  
}


void draw() {
  for (int x = 0; x<projectiles.size(); x++) {
      for (int y = 0; y<zombies.size(); y++) {
        float distance_x = zombies.get(y).x - projectiles.get(x).x;
        float distance_y = zombies.get(y).y - projectiles.get(x).y;
        float distance = sqrt(distance_x * distance_x + distance_y * distance_y);
          if (distance < (zombies.get(y).radius/2 + 10)) {
            zombies.remove(y);
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
    level = 1;
    background (0);
    fullScreen();
    startscreen = loadImage("santa.jpg");
    image(startscreen, 0, 0, width, height);
  }
  

  
  if (level==1) {
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
    if (barrels.size()==0) {
      for (int l = 0; l<5; l++) {
        barrels.add(new Barrel(random(width),random(height),50));
      }
    }
    
    background(255,255,255);
    // loading an image to variable ground
    //ground = loadImage("land.jpg");
    ////// loading image "ground" into game
    ////image(ground, 0, 0, width, height);
    //background(ground);
    fill(255,0 ,0);
    john.play();
         
    } 
    
    
  
  
  if (level==10) {
      if (zombies.size()==0) {
      for (int i= 0;i<100; i++){ //Creates 10 enemies
         zombies.add(new Zombie(random(0,100), random(height), 1, 1, 100));}
      for (int x= 0;x<100; x++){ //Creates 10 enemies
         zombies.add(new Zombie(random(width-100,width), random(height), 1, 1, 100));}
      for (int j= 0;j<100; j++){ //Creates 10 enemies
         zombies.add(new Zombie(random(width), random(height-100,height), 1, 1, 100));}
      for (int k= 0;k<100; k++){ //Creates 10 enemies
         zombies.add(new Zombie(random(width), random(0,100), 1, 1, 100));}
    }
    if (barrels.size()==0) {
      for (int l = 0; l<10; l++) {
        barrels.add(new Barrel(random(width),random(height),50));
      }
    }
    
    background(255,255,255);
    // loading an image to variable ground
    //ground = loadImage("land.jpg");
    ////// loading image "ground" into game
    ////image(ground, 0, 0, width, height);
    //background(ground);
    fill(255,0 ,0);
    john.play();
         
    } 
    
  if (level==20) {
      if (zombies.size()==0) {
      for (int i= 0;i<1000; i++){ //Creates 10 enemies
         zombies.add(new Zombie(random(0,100), random(height), 1, 1, 100));}
      for (int x= 0;x<1000; x++){ //Creates 10 enemies
         zombies.add(new Zombie(random(width-100,width), random(height), 1, 1, 100));}
      for (int j= 0;j<1000; j++){ //Creates 10 enemies
         zombies.add(new Zombie(random(width), random(height-100,height), 1, 1, 100));}
      for (int k= 0;k<1000; k++){ //Creates 10 enemies
         zombies.add(new Zombie(random(width), random(0,100), 1, 1, 100));}
    }
    if (barrels.size()==0) {
      for (int l = 0; l<5; l++) {
        barrels.add(new Barrel(random(width),random(height),50));
      }
    }
    
    background(255,255,255);
    // loading an image to variable ground
    //ground = loadImage("land.jpg");
    ////// loading image "ground" into game
    ////image(ground, 0, 0, width, height);
    //background(ground);
    fill(255,0 ,0);
    john.play();    
    } 
}
