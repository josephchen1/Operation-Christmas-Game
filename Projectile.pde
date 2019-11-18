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
    destroy = false;

    float xDiff = mouseX - x;
    float yDiff = mouseY - y;
    angle = atan2(yDiff, xDiff);
  }

  void display() {//displays projectile
    fill(176,224,230);
    ellipse(x, y, size, size);
  }

  void move() {//moves projectile in the direction mouse was pointing
    x += speed*cos(angle);
    y += speed*sin(angle);
  }
}
