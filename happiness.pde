//Participate in the survey: https://mel230.typeform.com/to/dEcJXj

import java.util.Map;
import java.util.Set;
import java.util.Iterator;

PImage happy;
PImage neutral;
PImage sad;
PImage emojiImage;
  
Mover[] hMovers;
Mover[] nMovers;
Mover[] sMovers;

ArrayList<HashMap<String, String>> questiontoAnswers = new ArrayList<HashMap<String, String>>();
StringList getAllEmotions;
float happinessMeter = 0.0;

void setup() {
  background(#FFEC15);
  size(1200,900, P2D);
  getJSONData("https://api.typeform.com/v1/form/dEcJXj?key=d8a49ffae6391b0d69921cd3287a7542617c4419&completed=true");
  
  happy = loadImage("happy.png");
  neutral = loadImage("neutral.png");
  sad = loadImage("sad.png");
  
  getAllEmotions = new StringList();
  
  for (int q = 0; q < questiontoAnswers.size(); q++){
    HashMap<String, String> count = questiontoAnswers.get(q);    
    getAllEmotions.append(count.get("\"I have input into how things are done.\""));
    getAllEmotions.append(count.get("\"I'm appreciated for what I do.\""));
    getAllEmotions.append(count.get("\"I know what I'm supposed to be doing.\""));
    getAllEmotions.append(count.get("\"I work on things I'm good at.\""));
    getAllEmotions.append(count.get("\"I do work that's interesting to me.\""));
    getAllEmotions.append(count.get("\"I'm treated well and equally to others\""));
    getAllEmotions.append(count.get("\"I've got the support and resources I need to do good work\""));
    getAllEmotions.append(count.get("\"I'm doing work that challenges me\""));
  }
  
  println(getAllEmotions);
  
  int hCount = 0;
  int nCount = 0;
  int sCount = 0;
  
  for (int i = 0; i < getAllEmotions.size(); i++) {
   String emotionCheck = getAllEmotions.get(i);
   
   if (emotionCheck.equals("Happy")){
     hCount++;
     happinessMeter += 1; 
   } else if (emotionCheck.equals("Neutral")){
     nCount++;
   } else if (emotionCheck.equals("Sad")){
     sCount++;
     happinessMeter -= 1;
   }
  }
  
  println("Happy = " + hCount + ", Neutral = " + nCount + ", Sad = " + sCount);

  happinessMeter = happinessMeter/(getAllEmotions.size());
   
  hMovers = new Mover[hCount];
  nMovers = new Mover[nCount];
  sMovers = new Mover[sCount];

  for (int i = 0; i < hCount; i++) {
    hMovers[i] = new Mover(random(1,10),0); 
  }
  
  for (int i = 0; i < nCount; i++) {
    nMovers[i] = new Mover(random(1,10),0); 
  }
  
  for (int i = 0; i < sCount; i++) {
    sMovers[i] = new Mover(random(1,10),0); 
  }
  
}

void draw() {
  background(#FFEC15);
  println(happinessMeter);
  float currentHappiness = map(happinessMeter, -1, 1, -400, 0);
  smiley(currentHappiness);
  println(currentHappiness);

  for (int i = 0; i < hMovers.length; i++) {
    hMovers[i].update();
    hMovers[i].display(happy);
    hMovers[i].checkEdges();
  }
  
  for (int i = 0; i < nMovers.length; i++) {
    nMovers[i].update();
    nMovers[i].display(neutral);
    nMovers[i].checkEdges();
  }
  
  for (int i = 0; i < sMovers.length; i++) {
    sMovers[i].update();
    sMovers[i].display(sad);
    sMovers[i].checkEdges();
  }
}