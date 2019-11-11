class Projectile {

  //Fields
  float x, y, angle, speed, xInitialOffset, yInitialOffset, size;
   float dx = speed*cos(angle);
    float dy = speed*sin(angle);
  boolean destroy;

  //Constructor
  Projectile(float xx, float yy) {
    speed = 50;
    size = 20;
    x = xx;
    y = yy;
    destroy = false;
    
    float xDiff = mouseX - x;
    float yDiff = mouseY - y;
    angle = atan2(yDiff,xDiff);
  }

  void display() {
    fill(255, 0, 0);
    ellipse(x, y, size, size);
  }

  void move() {
    x += dx;
    y += dy;
  }
}
