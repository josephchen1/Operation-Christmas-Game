class Particle {
  float radius = 10;
  PVector pos, speed; 
  ArrayList tail;
  float splash = 5;
  int taillength = 8;
  int explosionradiys = 100;
  float px;
  float py;



  Particle(float tempx, float tempy ) {
    px = tempx;
    py = tempy;
    float startx = tempx + random(-splash, splash);
    float starty = tempy + random(-splash, splash);

    float xspeed = random(-3, 3);
    float yspeed = random(-3, 3);

    pos = new PVector(startx, starty);
    speed = new PVector(xspeed, yspeed);    
    tail = new ArrayList();
  }


  void run() {

    pos.add(speed);

    tail.add(new PVector(pos.x, pos.y, 0));
    if (tail.size() > taillength) {
      tail.remove(0);
    }

   if (explosion.size() > MAX) {
    explosion.remove(0);
   }
  }

  void acceleration() {
    speed.mult(0.989);
  }

  void disappear() {
    float xdistance = px - pos.x;
    float ydistance = py - pos.y;
    float distance_traveled  = sqrt(xdistance * xdistance + ydistance * ydistance);

    for (int i =0; i<explosion.size(); i++) {
     if (distance_traveled >= 90) {
      explosion.remove(i);
    }
   }
  }

  void update() {
    for (int i = 0; i < tail.size(); i++) {
      PVector tempv = (PVector)tail.get(i);
      noStroke();
      fill(10*i+150);
      ellipse(tempv.x, tempv.y, radius, radius);
    }
  }
}
