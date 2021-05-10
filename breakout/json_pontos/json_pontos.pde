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
       if (melhores[0] < pontoAtual) {
         melhores[2] = melhores[1];
         melhores[1] = melhores[0];
         melhores[0] = pontoAtual;
       }
       else if(melhores[1] < pontoAtual){
         melhores[2] = melhores[1];
         melhores[1] = pontoAtual;
       }
       else if(melhores[2] < pontoAtual){
         melhores[2] = pontoAtual;
       }
   }
   println(melhores);
  
  //saveJSONArray(infoPlayers, "data.json");
  
}
