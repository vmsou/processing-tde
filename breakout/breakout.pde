Ball ball = new Ball(20, 640);
Player jogador = new Player(50, 670, 200, 20);

boolean Paused = false;

void drawLoop() {
  background(#c4c4c4);
  fill(0, 255, 0);
  ball.desenhar();
  jogador.desenhar();
}

void eventLoop() {
  ball.update();
  bs.update(ball);
  jogador.update();
  jogador.colide(ball);
}

void keyPressed() {
  if(key == CODED) {
    if (keyCode == LEFT) {
      jogador.left = true;
    }
    if(keyCode == RIGHT) {
      jogador.right = true;
    }
    
    if(keyCode == UP) {
      if (!Paused) {
        Paused = true;
        textSize(40);
        textAlign(CENTER, CENTER);
        text("Pausado", width/2, height/2);
        frameRate(0); 
      } 
      else {
        Paused = false;
        frameRate(60);
      }
    }
  }
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

void mouseWheel(MouseEvent event) {
  ball.speedX += event.getCount();
  ball.speedY += event.getCount();
}

void setup(){
  size(1280, 720);
  frameRate(60);
  colorMode(HSB, 360, 100, 100);
  noStroke();
}

void draw(){
  drawLoop();
  eventLoop();
}
