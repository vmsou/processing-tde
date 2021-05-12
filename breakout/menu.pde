boolean toggleMute = true;

void inicializar_menu(ControlP5 cp5) {
  cp5.addButton("Jogar")
    .setValue(1)
    .setPosition(width/2 - 125, height/2)
    .setSize(200, 19);
    
  cp5.addButton("Settings")
    .setValue(2)
    .setPosition(width/2 - 125, height/2 + 30)
    .setSize(200, 19);
    
  cp5.addButton("Voltar")
    .setValue(3)
    .setPosition(width/2 - 125, height/2 + 60)
    .setSize(200, 19);
    
  cp5.addToggle("Mute")
    .setValue(true)
    .setPosition(width/2 - 125, height/2)
    .setSize(200, 19)
    .setMode(ControlP5.SWITCH);
  
  cp5.get("Mute").hide();
  cp5.get("Voltar").hide();
}


void menu() {
  cp5.get("Jogar").show();
  cp5.get("Settings").show();
}

void HUD() {
  textSize(30);
  text("Pontos: " + jogador.pontos, 20, 30);
  text("Vida: " + jogador.health, 1170, 30);
}

public void Jogar() {
  if (Running) {
    GAME_STATUS = 1;
    cp5.get("Jogar").hide();
    cp5.get("Settings").hide();
  }  
}

public void Settings() {
  if (Running) {
    cp5.get("Jogar").hide();
    cp5.get("Settings").hide();
    cp5.get("Voltar").show();
    cp5.get("Mute").show();
  }
}

public void Voltar() {
  if (Running) {
    GAME_STATUS = 0;
    cp5.get("Voltar").hide();
    cp5.get("Mute").hide();
    menu();
  }
}

void Mute(boolean Flag) {
  if (Running) {
    if (Flag) {
      hit.unmute();
      dest.unmute();
  } else {
    hit.mute();
    dest.mute();
    }
  }
}
