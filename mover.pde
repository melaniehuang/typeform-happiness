class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Mover(){
    location = new PVector(0,height/2);
    velocity = new PVector(6,0);
    acceleration = new PVector(0.1,0);
  }
  
  void edges(){
    if (location.x > width){
      velocity.mult(-1);
      acceleration.mult(-1);
    } else if (location.x < 0){
      velocity.mult(-1);
      acceleration.mult(-1);
    }
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(50);
  }
  
  void display(){
    noStroke();
    fill(255,250,52);
    ellipse(location.x, location.y, 20,20);
  }

}