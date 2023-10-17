package mirae2.com;

public class Circle {
	Point po; // Composition
	private double radius;
	private double perimeters; // 2 * Math.pi * radius
	private double area; 	   // Math.pi * radius ^2
	
	public Circle() {}
	public Circle(Point po, double radius ) {
		this.po = po ; this.radius = radius;
	}
	public void calcPerimeter( ) {
		perimeters = 2* Math.PI * radius;
	}
	public void calcArea() {
		area = Math.PI* radius*radius;
	}
	public void setPoint(Point po) {
		this.po=po;
	}
	public Point getPoint() {
		return po;
	}
	public void setRadius( double radius) {
		this.radius =radius;
	}
	public double getRadius() {
		return radius;
	}
	public void print() {
		po.print();
		System.out.println("반지름 = " + radius);
	}
	public boolean collision(Circle cl) {
		double tot_radius = this.radius + cl.radius;
		double dist = po.distanceTo(cl.po);
		if (dist < tot_radius ) return true; // 충돌할때 거리값 두원의 반지름합이 두원의 중심점 사이의 값보다 작으면 충돌
		else return false; // 충돌하지 않음
	}
	

}

// 문제 : 성적표 개인
// 클래스배열 만들고 