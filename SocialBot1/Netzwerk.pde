import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

class Netzwerk
{
    // Sendet eine Nachricht an den Server 
    
    String post(Nachricht nachricht)
    {
        String nachrichtJSON = nachricht.toJson();
        
        String erg = null;
        try {
            URL url = new URL(API_URL);  

            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application/json");

            con.setDoOutput(true);
            OutputStreamWriter out = new OutputStreamWriter(con.getOutputStream());
            out.write(nachrichtJSON);
            out.close();

            String readStream = readStream(con.getInputStream());
            // Give output for the command line
            //System.out.println(readStream);
            erg = readStream;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return erg;
    }

    String get(){  
        String erg = "";
        try {
            URL url = new URL(API_URL);                      

            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            String readStream = readStream(con.getInputStream());
            // Give output for the command line
            //System.out.println(readStream);
            erg = readStream;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return erg;
    }

    private String readStream(InputStream in) {
        StringBuilder sb = new StringBuilder();
        try {
            BufferedReader reader = new BufferedReader(new InputStreamReader(in));

            String nextLine = "";
            while ((nextLine = reader.readLine()) != null) {
                sb.append(nextLine);

            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
    
    Nachricht[] nachrichtenAbrufen()
    {
    String ergebnis = get(); 
    Nachricht[] nachrichten;
    
    try {
      JSONArray array = parseJSONArray(ergebnis);
      nachrichten = new Nachricht[array.size()];
      for (int i = 0; i < array.size(); i++) {
        JSONObject row = array.getJSONObject(i);
        String name = row.getString("name");
        String stimmung = row.getString("stimmung");
        String grund = row.getString("grund");
        Nachricht n = new Nachricht(name, stimmung, grund);
        nachrichten[i]=n;      
      }
    }
    catch(Exception ex)
    {
      nachrichten = new Nachricht [0];
    }
    return nachrichten;
  }
  
}
