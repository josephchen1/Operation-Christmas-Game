class player{
  float x;
  float y;
  float dx;
  float dy;
  float health;
  String name;
  
  player(float xx, float yy, float ddx, float ddy, float hhealth, String nname){
    x = xx;
    y = yy;
    dx = ddx;
    dy = ddy;
    health = hhealth;
    name = nname;    
  }
  void display(){
    fill(0);
    rect(x,y,20,100);
  }
  
  void move(){
    x+=dx;
    y+=dy;
     if (x + 10 > width) {
      x = width - 10;
      dx *= -1; 
    }
    else if (x - 10 < 0) {
      x = 10;
      dx *= -1;
    }
    if (y + 10 > height) {
      y = height - 10;
      dy *= -1; 
    } 
    else if (y - 10 < 0) {
      y = 10;
      dy *= -1;
    }
  }
  
  void colliding_z(){}
  void colliding_a(){}
  
  
  
}
