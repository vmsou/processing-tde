ArrayList<Ball> balls = new ArrayList();
Ball ball = new Ball(20, 640);

Player jogador = new Player(50, 670, 200, 20);

boolean Running = true;

void HUD() {
  textSize(30);
  text("Pontos: " + jogador.pontos, 0, 30);
  text("Vida: " + jogador.health, 1150, 30);
}

void drawLoop() {
  background(#c4c4c4);
  fill(0, 255, 0);
  HUD();
  for (Ball b : balls) b.desenhar();
  jogador.desenhar();
  bs.desenhar();
}

void eventLoop() {
  if (jogador.health <= 0) Running = false;
  int i = 0;
  for (Ball b : balls) {
    b.update();
    bs.update(b);
    jogador.colide(b);
    if (!b.alive) balls.remove(i);
    i++;
  }
  jogador.update();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    Ball newBall = new Ball(mouseX, mouseY);
    balls.add(newBall);
  } else if (mouseButton == RIGHT && balls.size() > 0) balls.remove(0); 
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
      if (Running) {
        Running = false;
      } 
      else {
        Running = true;
      }
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

void mouseWheel(MouseEvent event) {
  for (Ball b : balls) {
    b.speedX += event.getCount();
    b.speedY += event.getCount();
  }
}

void setup(){
  size(1280, 720);
  frameRate(60);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  
  balls.add(ball);
}

void draw(){
  drawLoop();
  if (Running) eventLoop();
  else {
    textSize(40);
    text("Pausado", width/2 - 100, height/2);
  }
}
