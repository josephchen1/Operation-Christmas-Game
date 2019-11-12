class Player {
  private float x;
  private float y;
  private float speed;
  private int health=100;
  PVector pos = new PVector();
  Boolean[]keys = new Boolean[1];
  PVector velocity = new PVector(0,0);
  private float Pradius =50;
  
  public Player (float xx, float yy, float spd, int hhealth) {
    this.pos.x = xx;
    this.pos.y = yy;
    this.speed = spd;
    this.health = hhealth;
  }
  

  
  public void display(){
    stroke(0);
    fill(255, 122, 122);
    ellipse(this.pos.x,this.pos.y,Pradius,Pradius);
    ellipse(this.pos.x-20,this.pos.y,20,20);
    ellipse(this.pos.x+20,this.pos.y,20,20);
    
    for (int i = 0; i < projectiles.size(); i ++) {
        projectiles.get(i).display();
        projectiles.get(i).move();
    }
     for (int x = 0; x < zombies.size(); x ++) {
        zombies.get(x).display();
        zombies.get(x).move(john);
        punch(zombies.get(x));
     }
     
     for (int z = 0; z < barrels.size(); z ++) {
        barrels.get(z).display();
     }
     
    fill(255, 122, 122);
    rect(10,10,250,80);
    fill(0);
    text(health, 55,40);//health bar
  }
  
  
  
      public void teleport(){
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
  

  void move () { 
  if (keyPressed && (key=='w' || key=='a' || key=='s' || key=='d')){
  if (key == 'w') { velocity.y -= speed; }
  if (key == 'a') { velocity.x -= speed; }
  if (key == 's') { velocity.y += speed; }
  if (key == 'd') { velocity.x += speed; }
  pos.add(velocity);
  velocity.mult(0.9);
  }
  if (health <=0) {die();}
  
  teleport();
  
  }
  
  
  public void shoot(){
    
    if (mousePressed == true) {
      projectiles.add(new Projectile(this.pos.x, this.pos.y));
      
  }
  }
  
  public void punch(Zombie other) {
  
  float distance_x = other.x - pos.x;
  float distance_y = other.y - pos.y;

  float distance = sqrt(distance_x * distance_x + distance_y * distance_y);
   if (distance < (other.radius + Pradius)) {
   health -= 10;
   }
}

  public boolean overlap(Barrel other) {
  
  float distance_x = other.x - x;
  float distance_y = other.y - y;

  float distance = sqrt(distance_x * distance_x + distance_y * distance_y);
   if (distance < (other.radius + Pradius)) {return true;}
   else {return false;}
  
}

    public void play(){
  move();
  display();
  shoot();
  die();
}

public void die() {
if (health <= 0) {
  pos.y = -100000000; 
  pos.x = -100000000; 

  health = 0; 


  textSize(200);
  fill(196,24,24);
  text("WASTED", width/2, height/2); 
  textSize(50);

  
}

}


    

}
