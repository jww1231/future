package mirae3.com;

class Shape {
	public double area;

	public void display() {
		System.out.println("면적은 " + this.area + "입니다. ");
	}

	public void calcArea() {
	}
}

class Circle2 extends Shape {
	public double radius;
	public Circle2(double radius) {
		this.radius = radius;
		calcArea();
	}
	public double getRadius() {
		return radius;
	}
	public void setRadius(double radius) {
		this.radius = radius;
		calcArea();
	}
	public void calcArea() {
		area = Math.PI * radius * radius;
	}
}

class Rectangle extends Shape {
	public double width;
	public double height;
	public Rectangle(double width, double height) {
		this.width = width;
		this.height = height;
		calcArea();
	}
	public double getWidth() {
		return width;
	}

	public void setWidth(double width) {
		this.width = width;
		calcArea();
	}

	public double getHeight() {
		return height;
	}

	public void setHeight(double height) {
		this.height = height;
		calcArea();
	}

	public void calcArea() {
		area = width * height;
	}

}

class Triangle extends Shape { // 부모는 Parent(super) class / 자식은 Child(sub)
	public double height;
	public double width; // area

	public Triangle(double height, double width) {
		this.height = height;
		this.width = width;
		calcArea();
	}

	public double getWidth() {
		return width;

	}
	public void setWidth(double width) {
		this.width = width;
		calcArea();
	}
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
		calcArea();
	}
	public void calcArea() {
		area = width * height / 2;
	}
}
// 부모는 자식을 가리킬 수 있음
// 문제 Rectangle class를 작성하시오 Circle2기준으로
// width, height
public class d_03_Shape {
	public static void shareprint(Shape sh) {// 부모를 매개변수로 하는 경우
		if (sh instanceof Circle2) { // true / false를 리턴
			Circle2 cl = (Circle2) sh; // downcasting
			cl.setRadius(100); // 자식에만 있음
			cl.calcArea();
			cl.display();
		}
		if (sh instanceof Rectangle) { // true / false를 리턴
			Rectangle re = (Rectangle) sh; // downcasting
			re.setHeight(100); // 자식에만 있음
			re.setWidth(200);
			re.calcArea();
			re.display();
		}
		if (sh instanceof Triangle) { // true / false를 리턴
			Triangle tr = (Triangle) sh; // downcasting
			tr.setHeight(50); // 자식에만 있음
			tr.setWidth(50);
			tr.calcArea();
			tr.display();
		}

	}

	public static void main(String[] args) {
		Circle2 cl = new Circle2(10);
		cl.display();

		Shape sh = new Circle2(20);
		sh.display();
		// sh로 부터 반지름을 출력하시오
		Circle2 ccl = (Circle2) sh;
		System.out.println("원의 반지름은 " + ccl.getRadius());

		Rectangle re = new Rectangle(10, 20);
		re.display();

		Triangle tr = new Triangle(10, 5);
		tr.display();

		// 부모의 배열에 위의 cl, re, tr을 입력하시오 그리고 면적을 출력하시오

		Shape sh1 = new Circle2(20);
		sh1.display();
		// sh로 부터 반지름을 출력하시오

		Shape sh2 = new Rectangle(10, 20);
		sh2.display();

		Shape sh3 = new Triangle(10, 5);
		sh3.display();

		Shape[] parent = new Shape[3]; // 대량의 데이터를 처리하기 위해서 배열
		parent[0] = cl;
		parent[1] = re;
		parent[2] = tr;
		for (int i = 0; i < 3; i++) {
			parent[i].display();
		}
		// 디자인 패턴의 기본 패턴
		shareprint(cl); // 부모로 매개변수를 지정, 실제 자식 클래스를 전달해서 작업
		shareprint(re);
		shareprint(tr);
		for (int i = 0; i < 3; i++) {
			shareprint(parent[i]);

		}

	}
}
