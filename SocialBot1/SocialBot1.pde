User user;
Netzwerk net;
String API_URL = "https://sabsloe-mysocialbot-1.glitch.me/api";

void setup()
{
  
  net = new Netzwerk();
  user = new User("Max");
  
  // Sende eine Nachricht an den Server
  user.nachrichtSenden("Super!","Es ist Wochenende");
  
  // Hole alle Nachriten vom Server
  user.alleNachrichten();
}

void draw()
{

}
