class Player {
  int x, y;
  int w, h;
  int speed = 7;
  
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
}
