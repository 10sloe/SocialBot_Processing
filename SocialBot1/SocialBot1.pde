import http.requests.*;
String API_URL = "https://sabsloe-mysocialbot-1.glitch.me/api";

void setup()
{
  // Hole alle Nachrichten vom Server
  alleNachrichten();
}

public void alleNachrichten()
  {
    // Nachrichten als vom Server holen
    GetRequest get = new GetRequest(API_URL);
    get.send();
    String erg = get.getContent();
    println("JSON-Ausgabe");
    println(erg);
    println();
    
    println("Formatierte Ausgabe: ");
    JSONArray array = parseJSONArray(erg);
    if (array.size() == 0)
    {
      System.out.println("Keine Nachricht auf dem Server!");
    }
    else
    {
      System.out.println("Alle Nachrichten:");
      for (int i = 0; i < array.size(); i++) {
        JSONObject row = array.getJSONObject(i);
        Nachricht n = new Nachricht(row);
        n.ausgeben();
      }
    }    
  }

void draw()
{

}
