int y = 100;
int x = 100;
int y_speed = 2;
int x_speed = 2;
int txt_size = 50;

int radius = 200;
float theta = 1;

void setup() {
  size(800, 600);
}

void draw() {
  background(0, 68, 119);
  noFill();
  strokeWeight(3);
  stroke(0, 153, 255);
  line(width/2, height, width/2, 0);
  line(0, height/2, width, height/2);
  scale(1, -1);
  translate(0, -height);
  translate(width/2, height/2);
  circle(0, 0, radius*2);
  stroke(255);
  pushMatrix();
  rotate(theta);
  line(0, 0, radius, 0);
  popMatrix();
  noStroke();
  fill(255);
  float x = cos(theta) * radius;
  float y = sin(theta) * radius;
  circle(x, y, 15);
  theta += 0.01;
}
