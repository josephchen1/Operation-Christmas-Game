class Projectile {

  //Fields
  float x, y, angle, speed, xInitialOffset, yInitialOffset, size;
  boolean destroy;

  //Constructor
  Projectile(float xx, float yy, float s) {
    speed = 20;
    size = s;
    x = xx;
    y = yy;
    float dx = speed*cos(angle);
    float dy = speed*sin(angle);
    destroy = false;

    float xDiff = mouseX - x;
    float yDiff = mouseY - y;
    angle = atan2(yDiff, xDiff);
  }

  void display() {
    fill(255, 0, 0);
    ellipse(x, y, size, size);
  }

  void move() {
    x += speed*cos(angle);
    y += speed*sin(angle);
  }
}
