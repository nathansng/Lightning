int startX = 150;
int startY = 0;
int endX = 150;
int endY;

int aX = (int)(Math.random() * 10) - 5;
int bX = (int)(Math.random() * 10) + 5;
int cX = (int)(Math.random() * 10) + 5;
int dX = (int)(Math.random() * 10) - 5;
int eX = (int)(Math.random() * 10) - 5;
int fX = (int)(Math.random() * 10) - 5;
int gX = (int)(Math.random() * 10) - 5;
int hX = (int)(Math.random() * 10) - 5;

Cloud a, b, c, d, e, f, g, h;

void setup() {
	frameRate(60);
	size(300,300);
    background(0);
    strokeWeight(2);

    a = new Cloud (aX);
    b = new Cloud (50);
    c = new Cloud (100);
    d = new Cloud (150);
    e = new Cloud (200);
    f = new Cloud (250);
    g = new Cloud (300);
    h = new Cloud (350);
}

void draw() {
	lightning();
	a.show();
	a.cloudMove();
	b.show();
	b.cloudMove();
	c.show();
	c.cloudMove();
	d.show();
	d.cloudMove();
	e.show();
	e.cloudMove();
	f.show();
	f.cloudMove();
	g.show();
	g.cloudMove();
	h.show();
	h.cloudMove();
}

void mousePressed() {
	startX = mouseX;
	startY = 0;
	endX = 150;
	endY = 0;
	fill(255,255,255,75);
	rect(-50,-50,500,500);
}

void lightning () {
	noStroke();
  	fill(0,0,15,100);
  	rect(-50,-50,500,500,90);
	int lightningColor = (int)(Math.random()*200)+50;
	int lightningColor2 = (int)(Math.random()*200)+50;
	stroke(lightningColor, lightningColor, lightningColor2);
	while (endY < 300) {
		endX = startX + (int)(random(-9, 9));
		endY = startY + (int)(random(0, 9));
		line(startX, startY, endX, endY);
		startX = endX;
		startY = endY;
	}
}

class Cloud {

	int cloudX, cloudY;
	int cloudWidth, cloudHeight;

	Cloud(int x) {
		cloudX = x;
		cloudY = 25;
		cloudWidth = 100;
		cloudHeight = 100;
	}

	void cloudMove () {
		cloudX += 1;
		if (cloudX > 325) {
			cloudX = -50;
		}
	}

	void show () {
		noStroke();
		fill(110);
		ellipse(cloudX, cloudY, cloudWidth, cloudHeight);
	}
}
