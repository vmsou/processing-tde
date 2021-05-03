Ball ball = new Ball(20, 640);
Block b1 = new Block(100, 100, 170, 30, color(100, 100, 100));

void setup(){
  size(1280, 720);
  noStroke();
}
void draw(){
  background(#c4c4c4);
  fill(0, 255, 0);
  rect(0, 700, 1280, 20);
  ball.desenhar();
  
  ball.update();
  bs.update(ball);
}
