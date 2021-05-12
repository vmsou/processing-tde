boolean toggleMute = true;
PFont font;

void inicializar_menu(ControlP5 cp5) {
  cp5.addButton("Jogar")
    .setValue(1)
    .setPosition(width/2 - 200, height/2)
    .setSize(400, 40);
    
  cp5.addButton("Settings")
    .setValue(2)
    .setPosition(width/2 - 200, height/2 + 60)
    .setSize(400, 40);
    
  cp5.addButton("Sair")
    .setValue(10)
    .setPosition(width/2 - 200, height/2 + 120)
    .setSize(400, 40);
    
  cp5.addButton("Voltar")
    .setValue(3)
    .setPosition(width/2 - 200, height/2 + 180)
    .setSize(400, 40);
    
  cp5.addTextfield("Nome")
    .setPosition(width/2 - 200, height/2 - 60)
    .setSize(400, 40);
    
  cp5.addToggle("Mute")
    .setValue(false)
    .setPosition(width/2 - 200, height/2)
    .setSize(400, 40);
    
  cp5.addSlider("Volume")
    .setPosition(width/2 - 200, height/2 + 60)
    .setSize(400, 40)
    .setRange(-40, 10);
    
  pausedLabel = cp5.addTextlabel("Pausado")
    .setText("Pausado")
    .setPosition(width/2, height/2)
    .setSize(20, 20)
    .setFont(font)
    .setColor(360);
    
  pointsLabel = cp5.addTextlabel("Pontos")
    .setText("Pontos: 0")
    .setPosition(20, 30)
    .setSize(20, 20)
    .setFont(font)
    .setColor(360);
    
  healthLabel = cp5.addTextlabel("Vida")
    .setText("Vida: 3")
    .setPosition(1170, 30)
    .setSize(20, 20)
    .setColor(360)
    .setFont(font);
    
    
  cp5.get("Nome").hide();
  cp5.get("Mute").hide();
  cp5.get("Voltar").hide();
  cp5.get("Volume").hide();
  
  pausedLabel.hide();
  pointsLabel.hide();
  healthLabel.hide();
}


void menu() {
  cp5.get("Jogar").show();
  cp5.get("Settings").show();
  cp5.get("Sair").show();
}

void HUD() {
  pointsLabel.setText("Pontos: " + jogador.pontos);
  healthLabel.setText("Vida: " + jogador.health);
  pointsLabel.show();
  healthLabel.show();
}

public void Jogar() {
  if (Running) {
    GAME_STATUS = 1;
    cp5.get("Jogar").hide();
    cp5.get("Settings").hide();
    cp5.get("Sair").hide();
  }  
}

public void Settings() {
  if (Running) {
    cp5.get("Jogar").hide();
    cp5.get("Settings").hide();
    cp5.get("Sair").hide();
    cp5.get("Nome").show();
    cp5.get("Mute").show();
    cp5.get("Volume").show();
    cp5.get("Voltar").show();
  }
}

public void Sair() {
  if (Running) fexit();
}

public void Voltar() {
  if (Running) {
    cp5.get("Nome").hide();
    cp5.get("Voltar").hide();
    cp5.get("Mute").hide();
    cp5.get("Volume").hide();
    menu();
  }
  else if (Paused) {
    Running = true;
    GAME_STATUS = 0;
    cp5.get("Voltar").hide();
    menu();
  }
}

void Mute(boolean Flag) {
  if (Running) {
    if (!Flag) {
      hit.unmute();
      dest.unmute();
      song.unmute();
    } else {
      hit.mute();
      dest.mute();
      song.mute();
    }
  } 
}

void Volume(float value) {
  if (Running) {
    hit.setGain(value);
    dest.setGain(value);
    song.setGain(value);
  }
}

void Nome(String value) {
  if (Running) {
    jogador.nome = value;
  }
}
