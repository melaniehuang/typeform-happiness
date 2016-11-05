// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;

  Mover(float x , float y) {
    location = new PVector(x,y);
    velocity = new PVector(random(1,4),random(0.3,1.0));
    acceleration = new PVector(random(0.2,1.0),random(0.2,1.0));
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display(PImage emoji) {
    noStroke();
    noFill();
    image(emoji, location.x, location.y, 60, 60);
  }

  void checkEdges() {
    if (location.x > width - 60) {
      location.x = width - 60;
      velocity.x *= -1;
    } else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    }

    if (location.y > height - 60) {
      velocity.y *= -1;
      location.y = height - 60;
    } else if (location.y < 0) {
      location.y = 0;
      velocity.y *= -1;
    }
  }
}