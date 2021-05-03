Ball ball = new Ball();


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
  ellipse(ball.pos.x, ball.pos.y, ball.size, ball.size);
  ball.pos.x += ball.speedX*ball.directionX;
  ball.pos.y += ball.speedY*ball.directionY;
  if(ball.pos.y >= 700-(ball.size/2)) ball.directionY *= -1;
  if(ball.pos.x >= 1280-(ball.size/2) || ball.pos.x <= (ball.size/2)) ball.directionX *= -1;
  bs.update(ball);
}
