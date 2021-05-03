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
    areaLimite();
    x += speedX*directionX;
    y += speedY*directionY;
  }
  
  void areaLimite() {
    if (y > height-this.size || y < this.size) {
      directionY *= -1;
    }
    if (x > width-this.size || x < this.size) {
      directionX *= -1;
    }
  }
  
  void desenhar() {
      fill(0);
      ellipse(x, y, size, size);
  }
}
