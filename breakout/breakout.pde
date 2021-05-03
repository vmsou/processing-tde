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
  fill(0);
  ellipse(ball.x, ball.y, ball.size, ball.size);
  ball.x += ball.speedX*ball.directionX;
  ball.y += ball.speedY*ball.directionY;
  if(ball.y >= 700-(ball.size/2)) ball.directionY *= -1;
  if(ball.x >= 1280-(ball.size/2) || ball.x <= (ball.size/2)) ball.directionX *= -1;
  bs.update(ball);
}
