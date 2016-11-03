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
  // 
  
  HashMap<String, String> count = questiontoAnswers.get(0);  
  println(count.get("\"I have input into how things are done\""));
}