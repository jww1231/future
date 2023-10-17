package mirae3.com;
// 복사를 하고 싶은 클래스는 Cloneable을 구현해주어야 함


public class d_06_clone implements Cloneable {
	int rollno;
	String name;

	d_06_clone(int rollno, String name) {
		this.rollno = rollno;
		this.name = name;

	}

	// 오버라이딩
	// 예외가 발생하면 CloneNotSupportedException 클론이 클론을 지원하지 않는다
	// throws는 예외를 던져라 (실행을 중단)
	@Override
	public Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
	
	
	// 참조 문제를 해결하기 위해서 Object를 사용
	//
	public static void main(String[] args) {
		try {
			d_06_clone s1 = new d_06_clone(101, "대한민국");
			d_06_clone s2 = (d_06_clone) s1.clone(); // 데이터를 다른 곳에 복사
			System.out.println(s1.rollno + " " + s1.name);
			System.out.println(s1.rollno + " " + s2.name);
			System.out.println(s1 == s2); // 주소비교
			System.out.println(s1);
			System.out.println(s2);
		} catch (CloneNotSupportedException c) {
			c.printStackTrace();
		}
	}
} 

