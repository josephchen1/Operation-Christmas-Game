PImage weeb;

class Player {
  private float x;
  private float y;
  private float speed;
  private int health=100;
  PVector pos = new PVector();
  
  public Player (float xx, float yy, float spd, int hhealth) {
    this.pos.x = xx;
    this.pos.y = yy;
    this.speed = spd;
    this.health = hhealth;
  }
  
  PVector velocity = new PVector(0,0);
  
  public void display(){
    stroke(0);
    fill(255, 122, 122);
    ellipse(this.pos.x,this.pos.y,50,50);
    ellipse(this.pos.x-20,this.pos.y,20,20);
    ellipse(this.pos.x+20,this.pos.y,20,20);
    rect(10,10,250,health);
    fill(255, 255, 255);
    text(health, 55,40);//health bar
    for (int i = 0; i < projectiles.size(); i ++) {
        projectiles.get(i).display();
        projectiles.get(i).move();
    }
  }
  

  void move () { 
  if (keyPressed && (key=='w' || key=='a' || key=='s' || key=='d')){
  if (key == 'w') { velocity.y -= speed; }
  if (key == 'a') { velocity.x -= speed; }
  if (key == 's') { velocity.y += speed; }
  if (key == 'd') { velocity.x += speed; }
  pos.add(john.velocity);
  velocity.mult(0.9);
  }
  if (health <=0) {die();}
  }
  
  /*public void helth(){
    if (zombie.punch(player)){
    health -= 10;
    
    }
    
  }*/
 
  public void die(){

  }
  
  public void shoot(){
    if (mousePressed == true) {
      System.out.println("Hi");
      projectiles.add(new Projectile(this.pos.x, this.pos.y));
      
    }
  }
}
