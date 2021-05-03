color c1 = color(200, 50, 50);
color c2 = color(255, 140, 0);
color c3 = color(255, 255, 0);
color c4 = color(34, 139, 34);
color c5 = color(65, 105, 255);

color[] colors = {c1, c2, c3, c4, c5};

class Block {
  int x, y, w, h;
  color c;
  
  Block(int x, int y, int w, int h, int c) {
    this.x = x;
    this.w = w;
    this.y = y;
    this.h = h;
    this.c = c;
  }
  
  void desenhar() {
    fill(c);
    rect(x, y, w, h);
  }
  
  boolean colisao(int x2, int y2) {
    if ((x < x2 && x2 < x+w) && (y < y2 && y2 < y+h)) {
      return true;
    }
    return false;
  }
}

class BlockSystem {
  ArrayList<Block> blocks;
  int l;
  int n;
  
  BlockSystem(int n, int l) {
    blocks = new ArrayList<Block>();
    
    for (int j = 0; j < l; j++) {
      for (int i = 0; i < n; i++) {
        Block block = new Block((150*i) + (5*i) + 20, (30*j) + (5 * j) + 20, 150, 30, colors[j]);
        blocks.add(block);
      }
    }
    
  }
  
  void update(int x2, int y2) {
    for (Block b : blocks) {
      b.desenhar();
      if (b.colisao(x2,y2)) {println("Colisao");};
    }
  }
}

BlockSystem bs = new BlockSystem(8, 5);
//void setup() {
//  noStroke();
//  size(1280, 720);
//}

//void draw() {
//  bs.update();
// }
