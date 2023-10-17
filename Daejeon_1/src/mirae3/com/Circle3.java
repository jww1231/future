package mirae3.com;

public class Circle3 {
	ColorPoint po;
	double radius;
	double perimeters;
	double area;

	public Circle3() {}

	public Circle3(double radius) {
		this.radius = radius;
		this.po = new ColorPoint();
		calcPerimeter();
		calcArea();
	}
	public Circle3(double radius, ColorPoint po) {
		this.radius = radius;
		this.po = po;
		calcPerimeter();
		calcArea();
	}
	

	public void calcPerimeter() {
		perimeters = 2 * Math.PI * radius;
	}

	public void calcArea() {
		area = Math.PI * radius * radius;
	}

	public ColorPoint getPo() {
		return po;
	}

	public void setPo(ColorPoint po) {
		this.po = po;
	}

	public double getRadius() {
		return radius;
	}

	public void setRadius(double radius) {
		this.radius = radius;
		calcPerimeter();
		calcArea();
	}

	public double getPerimeters() {
		return perimeters;
	}

	public void setPerimeters(double perimeters) {
		this.perimeters = perimeters;
	}

	public double getArea() {
		return area;
	}

	public void setArea(double area) {
		this.area = area;
	}

	public boolean collisionCheck(Circle3 cl) {
		double radius = this.radius + cl.radius;
		double dist = this.po.distanceTo(cl.po);
		return dist < radius;
	}
	public String toString() {
		return po.toString() + " 반지름:"+ radius + "둘레:" + perimeters + " 면적:" + area;
	}
}