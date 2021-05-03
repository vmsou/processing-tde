class Ball {
  int x, y;
  int directionX = 1;
  int directionY = 1;
  int speedX = 2;
  int speedY = 3;
  int size = 10;
  
  Ball(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void update() {
    ball.x += speedX*directionX;
    ball.y += speedY*directionY;
    if(y >= 700-(size/2)) directionY *= -1;
    if(x >= 1280-(size/2) || x <= (size/2)) directionX *= -1;
  }
  
  void desenhar() {
      fill(0);
      ellipse(x, y, size, size);
  }
}
