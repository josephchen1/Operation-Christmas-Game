class Player {
  private float speed;
  private int health=100;
  PVector pos = new PVector();
  Boolean[]keys = new Boolean[1];
  PVector velocity = new PVector(0, 0);
  private float Pradius = 50;
  boolean hit;
  boolean dead;
  int ammo = 20;
  int energy = 100;

  public Player (float xx, float yy, float spd, int hhealth) {
    this.pos.x = xx;
    this.pos.y = yy;
    this.speed = spd;
    this.health = hhealth;
  }



  public void display() {
    stroke(0);
    fill(255, 122, 122);
    ellipse(this.pos.x, this.pos.y, Pradius, Pradius);
    ellipse(this.pos.x-20, this.pos.y, 20, 20);
    ellipse(this.pos.x+20, this.pos.y, 20, 20);
    textSize(20);
    text("Ammo: "+ammo, 80, 100);
    text("Energy: "+energy, 80, 200);
    for (int i = 0; i < projectiles.size(); i ++) {
      projectiles.get(i).display();
      projectiles.get(i).move();
    }
    for (int x = 0; x < zombies.size(); x ++) {
      zombies.get(x).display();
      zombies.get(x).move(john);
      punch(zombies.get(x));
      if (hit==true) {
        zombies.remove(x);
      }
    }

    for (int z = 0; z < barrels.size(); z ++) {
      barrels.get(z).display();
    }
    for (int i = 0; i < crates.size(); i ++) {
      crates.get(i).display();
    }

    fill(173, 255, 47);
    rectMode(CORNER);
    rect(12*health-1200, 0, 1200, 50);
    fill(0);
    text("Health: "+health, 80, 30);//health bar
  }



  public void teleport() {
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

  public void slowmotion() {
    if (keyPressed && energy>0) { 
      if (key == 'q' || key == 'Q') {
        delay(100);
        energy--;
      }
    }
  }

  public void reload() {
    if (keyPressed && ammoreload>0) { 
      if (key == 'r' || key == 'R') {
        ammo = 20;
        ammoreload--;
      }
    }
  }


  void move () { 
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


  public void shoot() {
    if (dead==false&&shootdelay==true&&ammo>0) {
      projectiles.add(new Projectile(this.pos.x, this.pos.y));
      shootdelay=false;
      ammo--;
    }
  }


  public void punch(Zombie other) {
    float distance_x = other.x - pos.x;
    float distance_y = other.y - pos.y;

    float distance = sqrt(distance_x * distance_x + distance_y * distance_y);
    if (distance < (other.radius/2 + Pradius/2)) {
      health -= 10;
      hit = true;
    } else
      hit = false;
  }

  public boolean overlap(AmmoCrate other) {
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
    reload();
    slowmotion();
  }


  public void die() {
    if (health <= 0) {
      pos.y = -100000000; 
      pos.x = -100000000; 

      health = 0; 
      dead = true;
      text("WASTED", width/2, height/2,-30);
      rectMode(CENTER);
      textSize(25);
      textAlign(CENTER);
      rect(600, 750, 750, 50);
      fill(0, 0, 0);
      text("Respawn", 600, 750);
      if (mouseX>225 && mouseX<975 && mouseY>735 && mouseY<800 && mousePressed==true) {
      level=-1;
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
