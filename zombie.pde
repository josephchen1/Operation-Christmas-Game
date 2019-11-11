class Zombie {
  float x;
  float y;
  float dx;
  float dy;
  float health;
  
  Zombie(float xx, float yy, float ddx, float ddy, float hhealth){
    x = xx;
    y = yy;
    dx = ddx;
    dy = ddy;
    health = hhealth;   
  }
  
  void display() {
    fill(0);
    rect(x,y,20,100);
  }
  
  public void update() {
    for (int i = 0; i < zombies.size(); i ++) {
        zombies.get(i).display();
        zombies.get(i).move(john);
    }
  }
  void move(Player player){
  float xDiff = player.x - x;
  float yDiff = player.y - x;
  float distance = sqrt(xDiff*xDiff+yDiff*yDiff);
  float angle = atan2(yDiff,xDiff);
  dx -= cos(angle);
  dy -= sin(angle);
  }
  
  
  
}
