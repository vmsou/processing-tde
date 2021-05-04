Ball ball = new Ball(20, 640);
Block b1 = new Block(100, 100, 170, 30, color(100, 100, 100));
Player jogador = new Player(50, 670, 200, 20);

void setup(){
  size(1280, 720);
  frameRate(60);
  noStroke();
}
void draw(){
  background(#c4c4c4);
  fill(0, 255, 0);
  ball.desenhar();
  
  ball.update();
  bs.update(ball);
  
  //jogador.colisao(ball.x, ball.y); // Terminar
  jogador.update();
  jogador.desenhar();

}


void keyPressed() {
  if(key == CODED) {
    if (keyCode == LEFT) {
      jogador.left = true;
    }
    if(keyCode == RIGHT) {
      jogador.right = true;
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
