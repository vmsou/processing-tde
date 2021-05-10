JSONObject player;
JSONArray infoPlayers;
int pontos = 110;
String nome = "Julia";
int melhores[] = {0, 0, 0};

void setup() {
  infoPlayers = loadJSONArray("data.json");
  //println(infoPlayers);
  //player = new JSONObject();
  //player.setInt("Pontos", pontos);
  //player.setString("Nome", nome);
  
  
  
  //infoPlayers.setJSONObject(infoPlayers.size(), player);
  
  
   for (int i = 0; i < infoPlayers.size(); i++) {
       JSONObject indice = infoPlayers.getJSONObject(i);
       int pontoAtual = indice.getInt("Pontos");
       if (infoPlayers[i].) {
         
       }
   }
  
  //saveJSONArray(infoPlayers, "data.json");
  
}
