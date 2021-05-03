color c5 = color(200, 50, 50);

class Block {
  int x, y, w, h;
  color c;
  
  public Block(int x, int y, int w, int h, int c) {
    this.x = x;
    this.w = w;
    this.y = y;
    this.h = h;
    this.c = c;
  }
  
  public void desenhar() {
    fill(c);
    rect(x, y, w, h);
  }
}

class BlockSystem {
  ArrayList<Block> blocks;
  int l;
  int n;
  
  BlockSystem(int n) {
    blocks = new ArrayList<Block>();
    
    for (int j = 0; j < n; j++) {
      for (int i = 0; i < n; i++) {
        Block block = new Block((150*i) + (5*i) + 20, (30*j) + (5 * j), 150, 30, c5);
        blocks.add(block);
      }
    }
    
  }
  
  void update() {
    for (Block b : blocks) {
      b.desenhar();
    }
  }
}


BlockSystem bs = new BlockSystem(8);

void setup() {
  size(1280, 720);
}

void draw() {
  bs.update();
}
