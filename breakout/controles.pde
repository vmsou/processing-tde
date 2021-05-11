// Mouse
void mousePressed() {
  if (GAME_STATUS == 1) {
    if (mouseButton == LEFT) {
    Ball newBall = new Ball(mouseX, mouseY);
    balls.add(newBall);
    } else if (mouseButton == RIGHT && balls.size() > 0) balls.remove(0);
  }
  else if (GAME_STATUS == 0) {
    
  }
   
}

void mouseWheel(MouseEvent event) {
  for (Ball b : balls) {
    b.speedX += event.getCount();
    b.speedY += event.getCount();
  }
}

// Teclado
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      jogador.left = true;
      jogador.direction = 1;
    }
    if (keyCode == RIGHT) {
      jogador.right = true;
      jogador.direction = -1;
    }
    
    if (key == 'p') {
      if (Running) Running = false;
      else Running = true;
    }
  }
  if (key == 'r') bs.reset(); 
  if (key == 'c') balls.clear();
}


void keyReleased() {
  if(key == CODED) {
    if (keyCode == LEFT) {
      jogador.left = false;
      jogador.speed = 0;
    }
    if(keyCode == RIGHT) {
      jogador.right = false;
      jogador.speed = 0;
    }
  }
}
