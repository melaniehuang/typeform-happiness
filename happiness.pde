import java.util.Map;
import java.util.Set;
import java.util.Iterator;

JSONObject json;
JSONArray questions;
JSONArray responses;

StringList titles;
ArrayList<HashMap<String, String>> questiontoAnswers = new ArrayList<HashMap<String, String>>();

PImage happy;
PImage neutral;
PImage sad;

Mover mover;

void setup() {
  background(#ffcc26);
  size(1200,900);
  getJSONData("https://api.typeform.com/v1/form/kHvr0z?key=d8a49ffae6391b0d69921cd3287a7542617c4419&completed=true");
  happy = loadImage("happy.png");
  neutral = loadImage("neutral.png");
  sad = loadImage("sad.png");
  
  mover = new Mover();
}

void draw() {
  background(#ffcc26);
  
  //mover.update();
  //mover.edges();
  //mover.display();

  StringList getAllEmotions = new StringList();
  
  for (int q = 0; q < questiontoAnswers.size(); q++){
    HashMap<String, String> count = questiontoAnswers.get(q);    
    getAllEmotions.append(count.get("\"I have input into how things are done\""));
    getAllEmotions.append(count.get("\"I’m appreciated for what I do\""));
    getAllEmotions.append(count.get("\"I know what I’m supposed to be doing\""));
    getAllEmotions.append(count.get("\"I work on things I’m good at\""));
    getAllEmotions.append(count.get("\"I’m treated well and equally to others\""));
  }
  
  for (int e = 0; e < getAllEmotions.size(); e++){
    String emotionCheck = getAllEmotions.get(e);
    println(emotionCheck);
    
    if (emotionCheck.equals("Happy")){
      image(happy, random(width), random(height),100,100);
    } else if (emotionCheck.equals("Neutral")){
      image(neutral, random(width), random(height),100,100);
    } else if (emotionCheck.equals("Sad")){
      image(sad, random(width), random(height),100,100);
    } else {
      println("No emotion");
    }
  }
}