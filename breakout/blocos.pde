color c1 = color(200, 50, 50); 
color c2 = color(255, 140, 0); 
color c3 = color(255, 255, 0);
color c4 = color(34, 139, 34); 
color c5 = color(65, 105, 255);

color[] colors = {c1, c2, c3, c4, c5};
int[] healths = {3, 2, 2, 2, 1};

class Block {
  int x, y, w, h;
  int maxHealth;
  int health;
  int pontos = 1;
  color c;
  boolean alive = true;
  
  Block(int x, int y, int w, int h, color c) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
  }
  
  void desenhar() {
    if (alive) {
      int bright = health * 255 / maxHealth;
      fill(c, bright);
      rect(x, y, w, h);
    } 
  }
  
  boolean colisao(int bx, int by, int bs) {
    int r = bs/2;
    if (alive) {
      if ((by > y-r && by < y + h + r) && (bx > x-r && bx < x + w + r)) {
        if (health > 1) {
          hit.play();
          hit.rewind();
        }
        return true;
      }
    }
    return false;
  }
}

class BlockSystem {
  ArrayList<Block> blocks;
  int l;
  
  BlockSystem(int n, int l) {
    blocks = new ArrayList();
   
    for (int j = 0; j < l; j++) {
      for (int i = 0; i < n; i++) {
        Block block = new Block((150*i) + (5*i) + 20, (30*j) + (5*j) + 80, 150, 30, colors[j]);
        block.maxHealth = healths[j];
        block.health = block.maxHealth;
        blocks.add(block);
      }
    }
  }
  
  void desenhar() {
    for (Block b : blocks) b.desenhar();
  }
  
  void update(Ball bola) {
    for (Block b : blocks) {
      if (b.colisao(bola.x, bola.y, bola.size)) {
        jogador.pontos += b.pontos;
        bola.directionY *= -1;
        b.health -= 1;
        if (b.health <= 0) {b.alive = false; dest.play(); dest.rewind();}
      };
    }
  }
  
  void reset() {
    for (Block b : blocks) {
      b.alive = true;
      b.health = b.maxHealth;
    }
  }
  
  void clear() {
    blocks.clear();
  }
}
