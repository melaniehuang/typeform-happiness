import java.util.Map;
import java.util.Set;
import java.util.Iterator;

JSONObject json;
JSONArray questions;
JSONArray responses;

StringList titles;
ArrayList<HashMap<String, String>> questiontoAnswers = new ArrayList<HashMap<String, String>>();

void setup() {
  background(#62FA9D); 
  getJSONData("https://api.typeform.com/v1/form/kHvr0z?key=d8a49ffae6391b0d69921cd3287a7542617c4419&completed=true");
  noLoop();
}

void draw() {
  // questions are: 
  // iterate through each hashmap and check values
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
  }
  
}