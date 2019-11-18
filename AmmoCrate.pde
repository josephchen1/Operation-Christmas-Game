class AmmoCrate {//attributes Ammo crate gives player 10 ammo when player goes over it
  public float x;
  public float y;
  public float size = 40;

  public AmmoCrate(float xx, float yy) { //constructor
    x = xx;
    y = yy;
  }

  public void display() {// displays the ammo crate (blue circle)
    noStroke();
    fill(0, 0, 255);
    circle(x, y, size);
  }
}
