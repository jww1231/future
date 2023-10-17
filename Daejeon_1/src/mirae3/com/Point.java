package mirae3.com;

public class Point {
	public double x;
	public double y; // 기본적으로 디폴터 생성자를 만들어줌 // 디폴트 생성자는 기본적으로 생성해야한다
	public Point( ) {} // 배열을 사용할때는 default 생성자가 반드시필요
	public Point(double x, double y) { // double은 더 세밀한 소수점 계산도 가능함
		this.x = x; this.y = y;
	}
	public void setX(double x) {
		this.x =x;
	}
	public double getX() {
		return x;
	}
	public void setY(double y) {
		this.y =y;
	}
	public double getY() {
		return y;
	}
	public double distance() { // 포인트의 원점으로 부터의 거리값
		return Math.sqrt(x*x + y*y);
	}
	public double distanceTo(Point po) { // 두 점간의 거리
		double dx = this.x - po.x;
		double dy = this.y - po.y;
		return Math.sqrt(dx*dx + dy*dy);
	}
	public double theta() { // 원점으로 그은 직선이 몇도인지
		double radian_result = Math.atan2(x,y); // 두 선의 내각
		return Math.toDegrees(radian_result); // 사람이 인식 가능한 각도
	}
	public void print() {
		System.out.println( "x=" + x + " y=" + y);
	}
	public void printx() {
		System.out.println( "x=" + x );
	}
	public void printy() {
		System.out.println( "y=" + y );
	}
	public String toString() {
		return "x좌표=" + x + " y좌표=" + y ;
	} 
	

}
