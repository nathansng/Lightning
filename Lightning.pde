int startX = 150;
int startY = 0;
int endX = 150;
int endY;

boolean shocked;

int aX = (int)(Math.random() * 30) - 15;
int bX = (int)(Math.random() * 30) + 35;
int cX = (int)(Math.random() * 30) + 85;
int dX = (int)(Math.random() * 30) + 135;
int eX = (int)(Math.random() * 30) + 185;
int fX = (int)(Math.random() * 30) + 235;
int gX = (int)(Math.random() * 30) + 285;
int hX = (int)(Math.random() * 30) + 335;
int jX = (int)(Math.random() * 30) + 385;

Cloud a, b, c, d, e, f, g, h, j;

People p1;

void setup() {
	frameRate(60);
	size(300,300);
    background(0);
    strokeWeight(2);

    a = new Cloud (aX);
    b = new Cloud (bX);
    c = new Cloud (cX);
    d = new Cloud (dX);
    e = new Cloud (eX);
    f = new Cloud (fX);
    g = new Cloud (gX);
    h = new Cloud (hX);
    j = new Cloud (jX);

    p1 = new People (100);
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
	j.show();
	j.cloudMove();

	p1.peopleShow();
	p1.peopleMove();
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
	while (endY < 345) {
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
		cloudY = 0;
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


class People {
	int peopleX, peopleY;
	boolean moveRight;

	boolean shocked = false;

	People (int x) {
		peopleX = x;
		peopleY = 250;
		moveRight = true;
	}

	void peopleMove () {
		if (shocked == false) {
			if (peopleX < 25) {
				moveRight = true;
			}
			if (peopleX > 275) {
				moveRight = false;
			}


			if (moveRight == true) {
				peopleX += 1;
			}	else if (moveRight == false) {
				peopleX -= 1;
			}
		}
	}

	void peopleShow () {
		fill(255);

		int move = 1;

		if (shocked == false) {
 
			if (peopleX > 50 && peopleX < 75 || peopleX > 100 && peopleX < 125 || peopleX > 150 && peopleX < 175 || peopleX > 200 && peopleX < 225 || peopleX > 250 && peopleX < 275 || peopleX > 300 && peopleX < 325 || peopleX > 350 && peopleX < 375) {
				move = 1;
			} else {
				move = 2;
			}
			
			if (moveRight == true) {
				if (move == 1) {
					noStroke();
					ellipse(peopleX, peopleY, 25, 25);
					stroke(255);
					line(peopleX, peopleY + 13, peopleX, peopleY + 30);
					line (peopleX, peopleY + 15, peopleX + 10, peopleY + 25); 	//arms
					line (peopleX, peopleY + 15, peopleX - 5, peopleY + 25); 
					line (peopleX, peopleY + 30, peopleX + 10, peopleY + 50); 	//legs
					line (peopleX, peopleY + 30, peopleX - 5, peopleY + 50);
				}
				if (move == 2) {
					noStroke();
					ellipse(peopleX, peopleY, 25, 25);
					stroke(255);
					line(peopleX, peopleY + 13, peopleX, peopleY + 30);
					line (peopleX, peopleY + 15, peopleX + 5, peopleY + 25);
					line (peopleX, peopleY + 30, peopleX, peopleY + 50); 	//legs
				}
			}
			if (moveRight == false) {
				if (move == 1) {
					noStroke();
					ellipse(peopleX, peopleY, 25, 25);
					stroke(255);
					line(peopleX, peopleY + 13, peopleX, peopleY + 30);
					line (peopleX, peopleY + 15, peopleX - 5, peopleY + 25);
					line (peopleX, peopleY + 30, peopleX, peopleY + 50);
				}
				if (move == 2) {
					noStroke();
					ellipse(peopleX, peopleY, 25, 25);
					stroke(255);
					line(peopleX, peopleY + 13, peopleX, peopleY + 30);
					line (peopleX, peopleY + 15, peopleX - 10, peopleY + 25); 	//arms
					line (peopleX, peopleY + 15, peopleX + 5, peopleY + 25); 
					line (peopleX, peopleY + 30, peopleX - 10, peopleY + 50); 	//legs
					line (peopleX, peopleY + 30, peopleX + 5, peopleY + 50);
				}
				
			}
				
		}

		if (shocked == true) {
			fill(255, 255, 0);
			stroke(255, 255, 0);
			strokeWeight(5);
			rect(peopleX - 15, peopleY - 15, 30, 80, 50);

			noStroke();
			fill(255);
			ellipse(peopleX, peopleY, 25, 25);
			stroke(255);
			strokeWeight(1);
			line(peopleX, peopleY + 13, peopleX, peopleY + 30);
			line (peopleX, peopleY + 20, peopleX - 10, peopleY + 10); 	//arms
			line (peopleX, peopleY + 20, peopleX + 10, peopleY + 10); 
			line (peopleX, peopleY + 30, peopleX - 10, peopleY + 50); 	//legs
			line (peopleX, peopleY + 30, peopleX + 10, peopleY + 50);


		}
	}

	
}

void keyPressed() {
	if (key == CODED) {
		if (keyCode == UP) {
			background(0);
			textAlign(CENTER);
			text("He's actually immune to lightning \n LOL\nBut you can always try again :D", 150, 150);
		}
	}
}