package mirae3.com;
class Student { // extends Object 모든 클래스는 object를 상속한다
	// 공통기능 : clone, toString, equals, hashcode ( 주소를 이용해서 중복되지 않는 수로 구분) 
	// 주소를 전달하면 같은 데이터를 다른 변수가 같이 가리키고 있음 
	// 데이터는 하나고 가리키는 것이 2개 이상이다
	// 클래스가 참조에 의해서 구동되기 때문에 복사가 안되기 때문에 Object
	// 비교에서 문제 ( 참조에 의한 경우, 주소비교 ==  , 값에 의한 비교(equals)
	// 포인터를 가리고 참조라는 말을 사용하기 위해 만들어진 문법
	// hash함수 : 김종호 인풋 (10 + 20 + 15 + 16 +22) => 주소의 개수로 나누어서 저장하는 주소
	private int rno;
	private String name;
	public Student (int r, String n) {
		rno=r;
		name = n;
	}
	public String toString() { // 문자열을 요구하는 함수에서 자동으로 실행
		return rno + " " + name;
	}
}

public class d_05_to_String {

	public static void main(String[] args) {
		Student s = new Student(101, "대한민국만세");
		System.out.print ("학생정보: ");
		System.out.println(s);

	}

}
