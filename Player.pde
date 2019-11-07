class Player {
  private float x;
  private float y;
  private float speed;
  private float health;
  private String name;
  PVector pos = new PVector();
  
  public Player (float xx, float yy, float spd, float hhealth, String nname) {
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
    rect(this.pos.x,this.pos.y,20,100);
    text(name,pos.x,pos.y-80);//name tag
    rect(10,10,250,health);//health bar
  }
}
