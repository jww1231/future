package mirae3.com;
//circle class ( 어떤 데이터를 다룰 것인가?, 데이터를 다루는 함수를 작성)
//ColorPoint class를 사용, radius , perimeter, area 정보
// 생성자로 초기화
// get/set 함수 생성
// 두원의 충돌여부 함수
// 출력함수

public class circletest extends ColorPoint {
	public String ColorPoint ;  
	ColorPoint po;
	private double radius;
	private double perimeters; // 2 * Math.pi * radius
	private double area; 	   // Math.pi * radius ^2
	
	public circletest() {}
	public circletest(ColorPoint po, double radius ) {
		this.po = po ; this.radius = radius;
	}
	public void calcPerimeter( ) {
		perimeters = 2* Math.PI * radius;
	}
	public void calcArea() {
		area = Math.PI* radius*radius;
	}
	public void setColorPoint(ColorPoint po) {
		this.po=po;
	}
	public Point getColorPoint() {
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
	public boolean collision(Circle3 cl) {
		double tot_radius = this.radius + cl.radius;
		double dist = po.distanceTo(cl.po);
		if (dist < tot_radius ) return true; // 충돌할때 거리값 두원의 반지름합이 두원의 중심점 사이의 값보다 작으면 충돌
		else return false; // 충돌하지 않음
	}
	

}
	
	

