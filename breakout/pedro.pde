class Player {
  int x, y;
  int w, h;
  float speed = 0;
  boolean right, left;
  
  Player(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void desenhar() {
    fill(0);
    rect(x, y, w, h);
  }
  
  boolean colisao(int x2, int y2, int r) {
    if ((x2 > x-r && x2 < x + w + r) && (y2 > y-r && y2 < y + h + r)) {
      return true;
    }
    return false;
  }
  
  void velocidade() {
    if (right) speed = 5;
    if (left) speed = -5;
  }
  
  void update(Ball bola) {
    if (colisao(bola.x, bola.y, bola.size/2)) {
      bola.directionY *= -1;
    }
    velocidade();
    x += speed;
  }
}
