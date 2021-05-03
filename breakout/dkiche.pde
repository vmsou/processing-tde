class Ball {
  int x, y;
  int directionX = 1;
  int directionY = 1;
  int speedX = 5;
  int speedY = 5;
  int size = 20;
  
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
    if (y > height-this.size/2 || y < this.size/2) {
      directionY *= -1;
    }
    if (x > width-this.size/2 || x < this.size/2) {
      directionX *= -1;
    }
  }
  
  void desenhar() {
      fill(0);
      ellipse(x, y, size, size);
  }
}
