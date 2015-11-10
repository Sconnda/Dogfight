int num1 = 2;
int num2 = 2;
float rotSpeed = 0.1;
float [] x1 = new float[num1];
float [] y1 = new float[num1];
float [] vx1 = new float[num1];
float [] vy1 = new float[num1];
float [] theta1 = new float[num1];
color [] c1 = new color[num1];
float [] x2 = new float[num2];
float [] y2 = new float[num2];
float [] vx2 = new float[num2];
float [] vy2 = new float[num2];
float [] theta2 = new float[num2];
color [] c2 = new color[num2];

void setup() {
  size(500,500);
  for(int i = 0; i < num1; i++) {
    x1[i] = random(width);
    y1[i] = random(height);
    vx1[i] = 0;
    vy1[i] = 0;
    theta1[i] = 0;
    c1[i] = color(150,200,255);
  }
  c1[num1-1] = color(0,128,255);
  for(int i = 0; i < num2; i++) {
    x2[i] = random(width);
    y2[i] = random(height);
    vx2[i] = 0;
    vy2[i] = 0;
    theta2[i] = 0;
    c2[i] = color(255,200,150);
  }
  c2[num2-1] = color(255,128,0);
}

void draw() {
  background(255);
  noStroke();
  for(int i = 0; i < num1; i++) {
    fill(c1[i]);
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
  for(int i = 0; i < num2; i++) {
    fill(c2[i]);
    x2[i] += vx2[i];
    y2[i] += vy2[i];
    if(x2[i] > width) {
      x2[i] = 0;
    } else if(x2[i] < 0) {
      x2[i] = width;
    }
    if(y2[i] > height) {
      y2[i] = 0;
    } else if(y2[i] < 0) {
      y2[i] = height;
    }
    triangle(x2[i]+10*cos(theta2[i]+5*PI/6),y2[i]-10*sin(theta2[i]+5*PI/6),x2[i]+10*cos(theta2[i]),y2[i]-10*sin(theta2[i]),x2[i]+10*cos(theta2[i]-5*PI/6),y2[i]-10*sin(theta2[i]-5*PI/6));
  }
  if (keyPressed) {
    if (keyCode == UP) {
      vx1[num1-1] += 0.25*cos(theta1[num1-1]);
      vy1[num1-1] -= 0.25*sin(theta1[num1-1]);
    }
    if (keyCode == RIGHT) {
      theta1[num1-1] -= rotSpeed;
    }
    if (keyCode == LEFT) {
      theta1[num1-1] += rotSpeed;
    }
  }
  if (mousePressed) {
    if (mouseButton == RIGHT) {
      vx2[num2-1] += 0.25*cos(theta2[num2-1]);
      vy2[num2-1] -= 0.25*sin(theta2[num2-1]);
    }
    if (mouseX < x2[num2-1]) {
      theta2[num2-1] = (PI-atan((mouseY-y2[num2-1])/(mouseX-x2[num2-1])));
    } else {
      theta2[num2-1] = (atan((y2[num2-1]-mouseY)/(mouseX-x2[num2-1])));
    }
  }
}