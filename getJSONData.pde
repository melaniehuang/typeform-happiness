void getJSONData(String requestURL) {
  JSONObject json = loadJSONObject(requestURL);
  JSONArray questions = json.getJSONArray("questions");
  StringList titles = new StringList();
  
  HashMap<String,String> idtoQuestion = new HashMap<String,String>();

  for (int q = 0; q < questions.size(); q++){
    JSONObject question = questions.getJSONObject(q);
    String title = question.getString("question");
    String id = question.getString("id");
    
    for (int hm = 0; hm < questions.size(); hm++){
      idtoQuestion.put(id, title);
    }
  }
  
  JSONArray responses = json.getJSONArray("responses");

  for (int r = 0; r < responses.size(); r++){
    //get one response
    JSONObject response = responses.getJSONObject(r);
    //get "answers" of that response
    JSONObject responseAnswers = response.getJSONObject("answers");
    //hashmap to store this users answers
    HashMap<String, String> answers = new HashMap<String, String>();
    
    //for all the answers, select one answer - check the id of that responseAnswers
    Set<String> answerKeys = responseAnswers.keys();
    Iterator<String> answerIterator = answerKeys.iterator();

    while (answerIterator.hasNext()) {
      String uglyQ = answerIterator.next();
      String niceQ = idtoQuestion.get(uglyQ);
      
      answers.put(niceQ, responseAnswers.getString(uglyQ));
    }
        
    //check Hashmap idtoQuestion to see if it matches an id
    //then store the title as a "questionName"
    questiontoAnswers.add(answers);        
  }
}