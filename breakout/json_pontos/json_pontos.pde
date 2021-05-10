JSONObject player;
JSONArray infoPlayers;
int pontos = 110;
String nome = "Julia";
int melhores[] = {0, 0, 0};
int nomeMelhores[] = {"-", "-", "-"};

void setup() {
  infoPlayers = loadJSONArray("data.json");
  
  // CODIGO QUE SALVA E INSERE AS INFORMACOES DO PLAYER NO ARRAY
  
  //player = new JSONObject();
  //player.setInt("Pontos", pontos);
  //player.setString("Nome", nome);
  //infoPlayers.setJSONObject(infoPlayers.size(), player);
  
   // CODIGO QUE ACHA OS 3 MELHORES PONTOS
   for (int i = 0; i < infoPlayers.size(); i++) {
       JSONObject indice = infoPlayers.getJSONObject(i);
       int pontoAtual = indice.getInt("Pontos");
       int nomeAtual = indice.getInt("Nome");
       if (melhores[0] < pontoAtual) {
         melhores[2] = melhores[1];
         melhores[1] = melhores[0];
         melhores[0] = pontoAtual;
         nomeMelhores[2] = nomeMelhores[1];
         nomeMelhores[1] = nomeMelhores[0];
         nomeMelhores[0] = nomeAtual;
       }
       else if(melhores[1] < pontoAtual){
         melhores[2] = melhores[1];
         melhores[1] = pontoAtual;
         nomeMelhores[2] = nomeMelhores[1];
         nomeMelhores[1] = nomeAtual;
       }
       else if(melhores[2] < pontoAtual){
         melhores[2] = pontoAtual;
         nomeMelhores[2] = nomeAtual;
       }
   }
   println(melhores);
  
  // CODIGO QUE SALVA O ARRAY ATUALIZADO
  
  //saveJSONArray(infoPlayers, "data.json");
  
}
