PImage explosion;

class Barrel {
  public float x;
  public float y;
  public float explosionradius;
  float radius = 20;
  
  public Barrel(float xx, float yy, float radius) {
    x = xx;
    y = yy;
    explosionradius = radius;
  }
  
  public void explode(float x, float y) {
    explosion = loadImage("explosion.jpg");
    image(explosion, x, y, 50, 50);
  }
  
  public void display() {
    noStroke();
    fill(255,100,100);
    circle(x,y,50);
  }
}
