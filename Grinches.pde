class Grinch {//attributes of Grinches (the enemy in the game) 
  float x;
  float y;
  float health;
  float radius = 20;
  float speed;
  PImage img;



  Grinch(float xx, float yy, float spd) {//constructor
    x = xx;
    y = yy;
    speed = spd;        
    img = loadImage("grinches.png");
  }

  void display() {//displays the image of a grinch 
    image (img, x, y);
  }

  void move(Player player) {//moves the grinch towards the current position of the player
    float xDiff = x - player.pos.x;
    float yDiff = y - player.pos.y;
    float angle = atan2(yDiff, xDiff);
    x -= cos(angle)*speed;
    y -= sin(angle)*speed;
  }

  public void update() {//incorporates display method and move method into one method and implements them for every grinch
    for (int i = 0; i < grinches.size(); i ++) {
      grinches.get(i).display();
      grinches.get(i).move(john);
    }
  }
}
