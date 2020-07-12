class Nachricht
{
    // Attribute
    String name;
    String stimmung; 
    String grund;

    //Konstruktor
    Nachricht(String name_, String stimmung_, String grund_)
    {
        name = name_;
        stimmung = stimmung_;
        grund = grund_;
    }

    // Methoden
    // Ausgabe auf der Konsole
    void ausgeben()
    {
        System.out.println("****** Nachricht *****");
        System.out.println("Name: " + name);
        System.out.println("Stimmung: " + stimmung);
        System.out.println("Grund: " + grund);
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
