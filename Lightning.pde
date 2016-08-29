int startX = 0;
int startY = 150;
int endX = 0;
int endY = 150;

void setup() {
  size(300,300);
  strokeWeight(1);
  background(255);
}

void draw() {
	int red = (int)(Math.random()*256);
	int green = (int)(Math.random()*256);
	int blue = (int)(Math.random()*256);
	stroke(red, green, blue);

	line(startX, startY, endX, endY);

	while(endX < 300) {
		endX = startX + (int)(Math.random()*10);
		endY = startY + (int)((Math.random()*19)-9);
		startX = endX;
		startY = endY;
	}
}

void mousePressed() {
	startX = 0;
	startY = 150;
	endX = 0;
	endY = 150;
}

