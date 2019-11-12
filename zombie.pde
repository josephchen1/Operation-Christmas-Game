class Zombie {
  float x;
  float y;
  float dx = random(.1, .9);
  float dy = random(.1, .9);
  float health;
  float radius = 20;
  
  Zombie(float xx, float yy, float ddx, float ddy, float hhealth){
    x = xx;
    y = yy;
    dx = ddx;
    dy = ddy;
    health = hhealth;   
  }
  
  void display() {
    fill(0);
    ellipse (x,y,radius,radius);
  }
  
  public void update() {
    for (int i = 0; i < zombies.size(); i ++) {
        zombies.get(i).display();
        zombies.get(i).move(john);
    }
  }
  void move(Player player){
    x += 0.01*dx;
    y += 0.01*dy;
    float xDiff = x - player.pos.x;
    float yDiff = y - player.pos.y;
    float distance = sqrt(xDiff*xDiff+yDiff*yDiff);
    float angle = atan2(yDiff,xDiff);
    dx -= cos(angle);
    dy -= sin(angle);
  }
  
  /*public void die (){
    if (shot)
    remove from array list
    
  }
  */
  
  
  
}
