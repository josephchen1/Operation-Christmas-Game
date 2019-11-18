class Grinch {
  float x;
  float y;
  float health;
  float radius = 20;
  float speed;


  Grinch(float xx, float yy, float spd) {
    x = xx;
    y = yy;
    speed = spd;
  }

  void display() {
    noStroke();
    fill(50,205,50);
    ellipse (x, y, radius, radius);
  }

  public void update() {
    for (int i = 0; i < grinches.size(); i ++) {
      grinches.get(i).display();
      grinches.get(i).move(john);
    }
  }
  
  void move(Player player) {
    float xDiff = x - player.pos.x;
    float yDiff = y - player.pos.y;
    float angle = atan2(yDiff, xDiff);
    x -= cos(angle)*speed;
    y -= sin(angle)*speed;
    
      
      
  

    //x -= 10*(1/xDiff);
    //y -= 10*(1/yDiff);
    //float distance = sqrt(xDiff*xDiff+yDiff*yDiff);
    //float angle = atan2(yDiff, xDiff);
    //dx -= cos(angle);
    //dy -= sin(angle)
  }
}
