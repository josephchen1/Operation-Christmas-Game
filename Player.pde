PImage weeb;

class Player {
  private float x;
  private float y;
  private float speed;
  private int health=100;
  private String name;
  PVector pos = new PVector();
  
  public Player (float xx, float yy, float spd, int hhealth, String nname) {
    this.pos.x = xx;
    this.pos.y = yy;
    this.speed = spd;
    this.health = hhealth;
    this.name = nname;    
  }
  
  PVector velocity = new PVector(0,0);
  
  public void display(){
    stroke(0);
    fill(255, 122, 122);
    weeb = loadImage("weeb.png");
    image(weeb, this.pos.x,this.pos.y,50,100);
    text(name,pos.x,pos.y-80);//name tag
    rect(10,10,250,health);
    fill(255, 255, 255);
    text(health, 55,40);//health bar
  }
  

  void move () { 
  if (keyPressed && (key=='w' || key=='a' || key=='s' || key=='d')){
  if (key == 'w') { john.velocity.y -= john.speed; }
  if (key == 'a') { john.velocity.x -= john.speed; }
  if (key == 's') { john.velocity.y += john.speed; }
  if (key == 'd') { john.velocity.x += john.speed; }
  john.pos.add(john.velocity);
  john.velocity.mult(0.9);
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
  
   /*public boolean hit(){
    return(this.pos.x==zombie.x&&this.pos.y==zombie.y);
  }*/
  }
}
