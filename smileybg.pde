void smiley(float howHappy){
  noStroke();
  fill(0);
  ellipse(width/4,340,40,40);
  ellipse(width/2+(width/4),340,40,40);
  
  //println(howHappy);
 
  stroke(0);
  strokeWeight(40);
  noFill();
  bezier(width/4, 600, (width/8)*3, height-(height/8) + howHappy, width-((width/8)*3), height - (height/8) + howHappy, width/2+(width/4), 600);  
}