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
  
  void colisao(int x2, int y2) {
    //
  }
  
  void velocidade() {
    if (right) speed = 5;
    if (left) speed = -5;
  }
  
  void update() {
    velocidade();
    x += speed;
  }
}
