class Player {//attributes
  public int money = 0;
  private float speed;
  private int health=100;
  PVector pos = new PVector();
  Boolean[]keys = new Boolean[1];
  PVector velocity = new PVector(0, 0);
  private float Pradius = 50;
  boolean hit;
  boolean dead;
  int ammo = 20;
  float energy = 100;
  float size = 20;
  int bulletupgrade = 0;
  int speedupgrade = 0;

  public Player (float xx, float yy, float spd, int hhealth) {//constructor
    this.pos.x = xx;
    this.pos.y = yy;
    this.speed = spd;
    this.health = hhealth;
  }



  public void display() {//displays player (essentially three circles) along with energy and ammo amount as well as a projectile if it exists
    stroke(0);
    fill(255, 10, 14);
    ellipse(this.pos.x, this.pos.y, Pradius, Pradius);
    ellipse(this.pos.x-20, this.pos.y, 20, 20);
    ellipse(this.pos.x+20, this.pos.y, 20, 20);
    textSize(20);
    for (int i = 0; i < projectiles.size(); i ++) {
      projectiles.get(i).display();
      projectiles.get(i).move();
    }
    for (int x = 0; x < grinches.size(); x ++) {//displays grinches and haves them move toward the player
      grinches.get(x).display();
      grinches.get(x).move(john);
      punch(grinches.get(x)); //checks if grinch hits player
      if (hit==true) { //grinches die after one hit of the player
        grinches.remove(x);
      }
    }

    for (int z = 0; z < barrels.size(); z ++) {//displays barrels
      barrels.get(z).display();
    }
    for (int i = 0; i < crates.size(); i ++) {//displays ammo crates
      crates.get(i).display();
    }

    fill(255, 25, 47);
    rectMode(CORNER); // health bar
    rect(12*health-1200, 0, 1200, 5);
    fill(0);
  }



  public void teleport() { //if player goes off the screen it comes back on the other side
    if (pos.y < -Pradius) {
      pos.y = height + Pradius;
    } else
      if (pos.y > height + Pradius) {
        pos.y = -Pradius;
      }
    if (pos.x< -Pradius) {
      pos.x = width +Pradius;
    } else  if (pos.x > width + Pradius) {
      pos.x = -Pradius;
    }
  }

  public void slowmotion() {//press q for slow motion which costs energy
    if (keyPressed && energy>0) { 
      if (key == 'q' || key == 'Q') {
        delay(100);
        energy--;
      }
    }
  }


  void move () { //player wasd move function
    if (up) { 
      pos.y -= speed;
    }
    if (left) { 
      pos.x -= speed;
    }
    if (down) { 
      pos.y += speed;
    }
    if (right) { 
      pos.x += speed;
    }

    if (health <=0) {
      textSize(200);
      fill(196, 24, 24);
      textSize(230);
      die();
    }
    teleport();
  }


  public void shoot() {//adding projectiles
    if (dead==false&&shootdelay==true&&ammo>0) {
      projectiles.add(new Projectile(this.pos.x, this.pos.y, size));
      shootdelay=false;
      ammo--;
    }
  }


  public void punch(Grinch other) {//player grinch overlap method
    float distance_x = other.x - pos.x;
    float distance_y = other.y - pos.y;

    float distance = sqrt(distance_x * distance_x + distance_y * distance_y);
    if (distance < (other.radius/2 + Pradius/2)) {
      health -= 10;
      hit = true;
    } else
      hit = false;
  }

  public boolean overlap(AmmoCrate other) { // player ammo crate overlap method
    float distance_x = other.x - pos.x;
    float distance_y = other.y - pos.y;
    float distance = sqrt(distance_x * distance_x + distance_y * distance_y);
    if (distance < (other.size/2 + Pradius/2)) {
      return true;
    } else {
      return false;
    }
  }

  public void play() {
    move();
    display();
    shoot();
    slowmotion();
    keyPressed();
  }

  public void keyPressed() {
    if (money >= 10 && (key=='R'||key=='r')) {
      money-=10;
      john.speed+=0.1;
      speedupgrade++;
    }
    if (money >= 30 && (key=='E'||key=='e')) {
      money-=30;
      john.health=100;
    }
    if (money >= 10 && (key=='F'||key=='f')) {
      money-=10;
      john.size+=5;
      bulletupgrade++;
    }
  }

  public void die() {
    if (health <= 0) {
      pos.y = -100000000; 
      pos.x = -100000000; 

      health = 0; 
      dead = true;
      textAlign(CENTER);
      text("WASTED", width/2, height/2+100, -30);
      rectMode(CENTER);
      textSize(25);
      text("YOUR SCORE: "+killcount, width/2, height/2-270);
      text("HIGHSCORE: "+highscore, width/2, height/2-220);
      textAlign(CENTER);
      fill(169, 169, 169);
      rect(540, 600, 500, 50);
      fill(0, 0, 0);
      text("Respawn", 540, 610);
      if (mouseX>290 && mouseX<790 && mouseY>550 && mouseY<650 && mousePressed==true) {
        level=-1;
        speed=3;
        bulletupgrade=0;
        speedupgrade=0;
        money=0;
        health=100;
        size=20;
        health = 100;
        dead = false;
        pos.y = 400; 
        pos.x = 600; 
        killcount = 0;
        ammo = 20;
        energy = 100;
      }
    }
  }
}
