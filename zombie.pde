class zombie{
  float x;
  float y;
  float dx;
  float dy;
  float health;
  
  zombie(float xx, float yy, float ddx, float ddy, float hhealth){
    x = xx;
    y = yy;
    dx = ddx;
    dy = ddy;
    health = hhealth;   
  }
  void display(){
    fill(0);
    rect(x,y,20,100);
  }
  void move(){}
  
  
  
}
