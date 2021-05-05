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
      float h = x * 360.0 / width;
      float s = y * 100.0 / height;
      float b = 90;
      fill(h, s, b);
      ellipse(x, y, size, size);
  }
}
