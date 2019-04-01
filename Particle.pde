class Particle {
  PVector position; 
  PVector velocity; 
  PVector acceleration;
  float decay;
  color currentCol;
  //PImage img = loadImage("flower.png");
  PShape p1 = loadShape("plant1.svg");
  //PShape p2 = loadShape("plant2.svg");
  PShape p3 = loadShape("plant3.svg");

  float mass = 1;  
 
  
 
  Particle(PVector currentPos, color currentPartColor) {
    acceleration = new PVector(2, 0.0); //setup acceleration for the particle
    position = currentPos.copy(); //setup position for the particle
    decay = 200.0; //setup decay
    currentCol = currentPartColor; //setup current particle color
    velocity = new PVector(random(-0.5,0.5), random(-0.5, 0.5)); //setup velocity for the particle
  }

  void run() {
    update();
    display();
  }
   
    // Newton's 2nd law: F = M * A
   // or A = F / M
   void applyForce(PVector force) {
    PVector f = force;
    f.div(mass); // Divide by mass 
    acceleration.add(f); // Accumulate all forces in acceleration

  }
  
  
  // Method to update position
  void update() {   
    velocity.add(acceleration);  // Velocity changes according to acceleration
    position.add(velocity); // position changes by velocity
    acceleration.mult(0);  // We must clear acceleration for each frame
    decay -= 0.3; //change the decay for each frame
  }

  // Method to display the particle
  void display() {
      //fill(currentCol, decay); //fill
      //ellipse(position.x, position.y, 7, 7); //draw the shape of the particle
      
      shape(p1,position.x-10,position.y+10,30,30);

      shape(p3,position.x+10,position.y-10,20,20);
      //tint(255, decay);
      fill(255,decay);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (decay < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
