class AmmoCrate {
  public float x;
  public float y;
  public float size = 40;

  public AmmoCrate(float xx, float yy) {
    x = xx;
    y = yy;
  }

  public void display() {
    noStroke();
    fill(0, 0, 255);
    circle(x, y, size);
  }
}
