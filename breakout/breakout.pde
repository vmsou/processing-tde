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
  
  jogador.desenhar();

}


void keyPressed() {
  if(key == CODED) {
    if (keyCode == LEFT) {
      jogador.x -= 10;
    }
    if(keyCode == RIGHT) {
      jogador.x += 10;
    }
  }
}
