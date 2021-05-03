float xp=50, yp=700; // coordenadas iniciais do player

//void setup() {
//  size(1280, 720);
//}

//void draw() {
//  background(128);
//  move_player();
//  desenha_player(xp,yp);
//}

void desenha_player(float xp, float yp){
  rect(xp,yp,40,20);
}

void move_player(){
  if (keyPressed) { 
    if (key == CODED) { // teste para evitar posição negativa, teste se celula a ir está vazia
      if (keyCode == RIGHT) xp++;
      if (keyCode == LEFT)  xp--;
    }
    keyPressed=false;
  }
}
