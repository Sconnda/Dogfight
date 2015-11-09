int num = 1;
float rotSpeed = 0.1;
float [] x1 = new float[num];
float [] y1 = new float[num];
float [] vx1 = new float[num];
float [] vy1 = new float[num];
float [] theta1 = new float[num];

void setup() {
  size(500,500);
  for(int i = 0; i < num; i++) {
    x1[i] = random(width);
    y1[i] = random(height);
    vx1[i] = 0;
    vy1[i] = 0;
    theta1[i] = 0;
  }
}

void draw() {
  background(255);
  noStroke();
  fill(0,0,255);
  for(int i = 0; i < num; i++) {
    x1[i] += vx1[i];
    y1[i] += vy1[i];
    if(x1[i] > width) {
      x1[i] = 0;
    } else if(x1[i] < 0) {
      x1[i] = width;
    }
    if(y1[i] > height) {
      y1[i] = 0;
    } else if(y1[i] < 0) {
      y1[i] = height;
    }
    triangle(x1[i]+10*cos(theta1[i]+5*PI/6),y1[i]-10*sin(theta1[i]+5*PI/6),x1[i]+10*cos(theta1[i]),y1[i]-10*sin(theta1[i]),x1[i]+10*cos(theta1[i]-5*PI/6),y1[i]-10*sin(theta1[i]-5*PI/6));
  }
  if (keyPressed) {
    if (keyCode == UP) {
      vx1[num-1] += 0.25*cos(theta1[num-1]);
      vy1[num-1] -= 0.25*sin(theta1[num-1]);
    }
    if (keyCode == RIGHT) {
      theta1[num-1] -= rotSpeed;
    }
    if (keyCode == LEFT) {
      theta1[num-1] += rotSpeed;
    }
  }
}