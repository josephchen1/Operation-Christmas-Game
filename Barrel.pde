class Barrel {//attributes of Barrel appears every round, if it is shot it kills all grinches in a radius of 200
  public float x;
  public float y;
  float radius = 20;

  public Barrel(float xx, float yy,float r) {//constructor
    x = xx;
    y = yy;
    radius = r;
  }

  public void explode(float x, float y) {//explosion method (removes all grinches in a radius of 200 if shot by projectile)
    for (int z = 0; z<grinches.size(); z++) {
      float distance_x = grinches.get(z).x - x;
      float distance_y = grinches.get(z).y - y;
      float distance = sqrt(distance_x * distance_x + distance_y * distance_y);
      if (distance <= 200) {
        grinches.remove(z);
      }
    }
  }

  public void display() {//diplays a red circle fo barrel
    noStroke();
    fill(255, 100, 100);
    circle(x, y, 50);
  }
}
