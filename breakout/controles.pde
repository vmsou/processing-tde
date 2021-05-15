// Mouse
void mousePressed() {
  if (GAME_STATUS == 1 && Running) {
    if (mouseButton == LEFT) {
    Ball newBall = new Ball(mouseX, mouseY);
    balls.add(newBall);
    } else if (mouseButton == RIGHT && balls.size() > 0) balls.remove(0);
  }
  else if (GAME_STATUS == 0) {
    
  }
   
}

void mouseWheel(MouseEvent event) {
  if (GAME_STATUS == 1 && Running) {
    for (Ball b : balls) {
      b.speedX += event.getCount();
      b.speedY += event.getCount();
    }
  }
}

// Teclado
void keyPressed() {
  Character k = Character.toLowerCase(key);
  if (GAME_STATUS == 1 && Running) {
    if (keyCode == LEFT || k == controles.get("esquerda")) {
      jogador.left = true;
      jogador.direction = 1;
    }
    if (keyCode == RIGHT ||k == controles.get("direita")) {
      jogador.right = true;
      jogador.direction = -1;
    } 
    if (k == controles.get("resetar_blocos")) bs.reset(); 
    if (k == controles.get("resetar_bolas")) balls.clear();
  }
  if (k == 'p') {
    if (Running) {
      Running = false; 
      cp5.get("Salvar").show();
      cp5.get("Voltar").show();
      Paused = true;
    }
    else {
      Running = true;
      cp5.get("Salvar").hide();
      cp5.get("Voltar").hide();
      Paused = false;
    }
  }
}


void keyReleased() {
  Character k = Character.toLowerCase(key);
  if (GAME_STATUS == 1) {
    if (keyCode == LEFT || k == controles.get("esquerda")) {
      jogador.left = false;
      jogador.speed = 0;
    }
    if(keyCode == RIGHT || k == controles.get("direita")) {
      jogador.right = false;
      jogador.speed = 0;
    }
  }
}
