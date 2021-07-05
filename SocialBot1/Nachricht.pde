class Nachricht
{
    // Attribute
    String name;
    String stimmung; 
    String grund;

    //Konstruktor mit Name, Stimmung und Grund
    Nachricht(String name_, String stimmung_, String grund_)
    {
        name = name_;
        stimmung = stimmung_;
        grund = grund_;
    }
    
    // Konstruktor aus einem JSON-Objekt
    Nachricht(JSONObject json)
    {
        name = json.getString("name");
        stimmung = json.getString("stimmung");
        grund = json.getString("grund");
    }

    // Methoden
    void ausgeben()
    {
        println("****** Nachricht *****");
        println("Name: " + name);
        println("Stimmung: " + stimmung);
        println("Grund: " + grund);
        println();
    }

    // Wandelt die Nachricht in einen JSON-String um
    String toJson()
    {
        String erg = null;
        try{
            JSONObject jo = new JSONObject();
            jo.setString("name", name);
            jo.setString("stimmung", stimmung);
            jo.setString("grund", grund);
            erg = jo.toString();
        }catch(Exception ex)
        {}

        return erg;
    }
    
    

}
