class Barrel {
  public float x;
  public float y;
  public float explosionradius;
  public float radius = 3;
  
  public Barrel(float xx, float yy, float radius) {
    x = xx;
    y = yy;
    explosionradius = radius;
  }
  
  public void explode() {
  
  }
  
  public void display() {
    noStroke();
    fill(255,100,100);
    ellipse (x,y,radius,radius);
  }
}
