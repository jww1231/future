package mirae3.com;

// inheritance (상속)
// 부모클래스 (super class) + 자식 클래스(sub class)
// 공통부분을 정의한 부모 - 자식이 공용
// 부모는 자식을 가리킬 수 있다. (제약사항 : 부모에 있는 것만 가리킬 수 있음)
// 자식이 추가한 내용을 가리킬 때는 downcasting 필요 ( 자식으로 환원한다 )
// overriding 재정의
// 함수이름도 같고 매개변수 타입이나 개수가 같은데 재정의를 통해 다른 일을 함
class Super_class { // 부모
	int num = 20; // 멤버변수 // 부모 것은 부모 값의 저장공간을 확보하고 남아 있음

	public void display() { // 멤버 함수
		System.out.println("슈퍼클래스에서 출력 ");
	}
}
// 부모의 함수를 재정의 해도 부모의 함수가 사라지는 것은 아니다.
// 다만 자식의 입장에서 자식의 재정이 함수가 우선한다.

// 부모의 멤버변수는 재정의 하지 않는것으로 한다.

public class d_01_superclass extends Super_class {
	int num = 10; // 멤버변수 재정의
	public void display() { // 메쏘드 재정의 overriding
		System.out.println("서브클래스에서 출력 ");
	}
	public void my_method() {
		d_01_superclass sub = new d_01_superclass(); // 자식 클래스 인스턴스
		sub.display(); // 자식 호츨
		super.display(); // 부모의 함수 호출
		display();// 자식 호출
		System.out.println("자식의 변수 : " + sub.num);
		System.out.println("부모의 변수 : " + super.num);
		System.out.println("자식의 변수 : " + num);
	}
	
	
	public static void main(String[] args) {
		d_01_superclass obj = new d_01_superclass(); // 자식 클래스 인스턴스
		obj.display(); // 자식 함수가 실행
		obj.my_method();
		
		
	}

}
