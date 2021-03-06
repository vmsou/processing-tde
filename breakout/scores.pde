JSONObject player;
JSONArray infoPlayers;
int pontos = 110;
String nome = "Julia";
int melhores[] = {0, 0, 0};
String nomeMelhores[] = {"-", "-", "-"};

void ordenar() {
  melhores[0] = 0;
  melhores[1] = 0;
  melhores[2] = 0;
  nomeMelhores[0] = "-";
  nomeMelhores[1] = "-";
  nomeMelhores[2] = "-";
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
       String nomeAtual = indice.getString("Nome");
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
  
  // CODIGO QUE SALVA O ARRAY ATUALIZADO
  
  //saveJSONArray(infoPlayers, "data.json");
  
}
