class Snow {//attributes (snow shows on start screen when you are choosing difficulty and floats down the screen
  float x; 
  float y;
  float alpha;
  float diameter;
  float speed = random(.1, .9);
  float speedX;

  Snow (float D) { //constructor
    x = random(-50, width+50);
    y = random(0,40);
    diameter = D;
  }
  
  void spreadY(int i) { //spreading snow along the top face of the screen
    y = y - i*3;
  }
  
  void display() { //display snow
    alpha = map(y, 0, height, 255, -50);
    noStroke();
    fill(255, alpha);
    ellipse(x, y, diameter, diameter);
    
    y = y + speed;
    x = x + speedX;
    
    //checking the boundary
    if (y > height) {
      y = -diameter;
    }
    if (x < 0-50) {
      x = width+diameter;} 
      else if (x > width+50){
      x = 0-diameter;
    }
    
    }
  void bounce(){//move function of snow
    y = y - speed; 
}
}
  
