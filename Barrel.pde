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
    System.out.print("explode");
    for (int z = 0; z<zombies.size(); z++) {
      float distance_x = zombies.get(z).x - x;
      float distance_y = zombies.get(z).y - y;
      float distance = sqrt(distance_x * distance_x + distance_y * distance_y);
      if (distance <= 200) {
        zombies.remove(z);
      }
    }
  }

  public void display() {
    noStroke();
    fill(255, 100, 100);
    circle(x, y, 50);
  }
}
