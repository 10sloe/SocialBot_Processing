class User
{
  // Attribute
  // Name des Benutzers
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
    String erg =  net.post(nachricht); 
    println("Meldung: " + erg);
    println();
  }

  public void alleNachrichten()
  {
    Nachricht[] nachrichten = net.nachrichtenAbrufen();
    if (nachrichten.length == 0)
    {
      println("Keine Nachricht auf dem Server!");
    } else
    {
      println("-----Alle Nachrichten: ---- ");
      for (int i = 0; i < nachrichten.length; i++)
      {
        nachrichten[i].ausgeben();
        System.out.println();
      }
    }
  }
}
