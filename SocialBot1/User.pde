import http.requests.*;

class User
{
  // Attribute
  String name; 

  // Konstruktor
  User(String name_)
  {
    name = name_;
  }

  // Methoden
  public void nachrichtSenden(String stimmung, String grund)
  {
    Nachricht nachricht = new Nachricht(name, stimmung, grund);
    PostRequest post = new PostRequest(API_URL);
    post.addHeader("Content-Type", "application/json");
    post.addData(nachricht.toJson());
    post.send();
    
    System.out.println(post.getContent());
    println();
  }

  
  
}
