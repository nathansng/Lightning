int startX = 150;
int startY = 0;
int endX = 150;
int endY;

void setup() {
	frameRate(60);
	size(300,300);
    background(0);
    strokeWeight(2);
}

void draw() {
	lightning();
	
}

void mousePressed() {
	startX = mouseX;
	startY = 0;
	endX = 150;
	endY = 0;
}

void lightning () {
	noStroke();
  	fill(0,0,15,100);
  	rect(-100,-100,1000,1000,90);
	int lightning = (int)(Math.random()*200)+50;
	stroke(lightning, lightning, (int)(Math.random()*200)+50);
	while (endY < 300) {
		endX = startX + (int)(random(-9, 9));
		endY = startY + (int)(random(0, 9));
		line(startX, startY, endX, endY);
		startX = endX;
		startY = endY;
	}
}
