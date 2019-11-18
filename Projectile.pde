class Projectile {
  
  PImage img;

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
    
    img = loadImage("snowballs.png");

    float xDiff = mouseX - x;
    float yDiff = mouseY - y;
    angle = atan2(yDiff, xDiff);
  }

  void display() {//displays projectile
    image(img, x, y);
  }

  void move() {//moves projectile in the direction mouse was pointing
    x += speed*cos(angle);
    y += speed*sin(angle);
  }
}
