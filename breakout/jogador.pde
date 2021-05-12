public static float clamp(float val, float min, float max) {
    return Math.max(min, Math.min(max, val));
}

class Player {
  String nome = "Jogador1";
  int x, y;
  int w, h;
  float speed = 0;
  boolean right, left;
  int health = 3;
  int pontos = 0;
  int direction = 1;
  
  Player(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void desenhar() {;
    float hc = x * 360.0 / width;
    float s = y * 100.0 / height;
    float b = 90;
    fill(hc, s, b);
    rect(x, y, w, h);
  }
  
  boolean colisao(int x2, int y2, int r) {
    float closestX = clamp(x2, x, x+w);
    float closestY = clamp(y2, y, y+h);
    
    float distanceX = x2 - closestX;
    float distanceY = y2 - closestY;
    
    float distanceSqr = (distanceX * distanceX) + (distanceY * distanceY);
    return distanceSqr < (r * r);
    
  }
  
  void velocidade() {
    if (right) speed = 7;
    if (left) speed = -7;
  }
  
  void colide(Ball bola) {
    if (colisao(bola.x, bola.y, bola.size/2)) {
      bola.directionY *= -1;
      bola.directionX = this.direction;
      hit.play();
      hit.rewind();
    }
  }
  
  void areaLimite() {
    if (x+w > width) {
      right = false;
      speed = 0;
    }
    if (x < 0) {
      left = false;
      speed = 0;
    }
  }
  
  void update() {
    areaLimite();
    velocidade();
    x += speed;
  }
}
