package mirae3.com;

class Parent {
	int x = 100;

	public void setvalue(int x) {
		this.x = x;
	}

	void method() {
		System.out.println("부모함수");
	}
}

class Child extends Parent {
	int x = 200;

	Child() {
		x = 1000;
	}// 디폴트 생성자 추가

	public void setvalue(int x) {
		this.x = x;
	}

	void method() {
		System.out.println("자식 제1-1함수 : " + x);
	}// 재정의

	void method2() {
		System.out.println("자식 제1-2함수 : " + x);
	}
}

class Child2 extends Parent {
	int x = 300;

	Child2() {
		x = 2000;
	}// 디폴트 생성자 추가

	public void setvalue(int x) {
		this.x = x;
	}

	void method() {
		System.out.println("자식 제2-1함수 : " + x);
	}// 재정의

	void method3() {
		System.out.println("자식 제2-2함수 : " + x);
	}
}

public class d_02_inheritance {
	public static void main(String[] args) {
		Child c = new Child();
		Parent p = new Child(); // 부모의 이름으로 인스턴스
		c.method(); // 자식 메쏘드가 실행
		p.method(); // 자식 메쏘드가 실행
		c.method2();
		// p.method2();// 부모가 자식을 가르킬수 있는데 함수는 부모에게 있는것만 가리킬 수 있음
		Child d = (Child) p;
		d.method2();
		// 배열에서 new를 2번하는 이유
		// 배열이름은 배열의 최선두번지 하나만 가리킴
		// 클래스 배열을 가리킬 주소를 만드는 것
		// 실제 클래스가 데이터를 저장할 공간을 만드는 것
		// 배열일때는 뉴가 두번 들어간다
		Child ch[] = new Child[3]; // 포인터 공간 (주소가 저장될 수 있도록)
		for (int i = 0; i < 3; i++) {
			ch[i] = new Child();
		}
		ch[0].setvalue(100);
		ch[0].setvalue(20);
		ch[0].setvalue(10);
		for (int i = 0; i < 3; i++) {
			ch[i].method();

		}
		
		Parent chp[] = new Parent [6];
		for (int i = 0; i < 3; i++) {
			chp[i]= new Child();
		}
		for (int i = 3; i < 6; i++) {
			chp[i]= new Child2();
		}
		for (int i = 0; i < 3; i++) {
			ch[i].method();;
		}// 문제 : 1번자식의 method2, 2번 자식의 method3을 chp 에서 호출하려고 할때 이를 해결해보시오
		Child ch1[]=new Child[3];
		Child2 ch2[]=new Child2[3];
		for (int i = 0; i < 3; i++) {
			ch1[i]= (Child) chp[i];
			ch1[i].method2();
		}
		for (int i = 3; i < 6; i++) {
			ch2[i-3]= (Child2) chp[i];
			ch2[i-3].method3();
		}
		// 자식에 추가된 메쏘드는 부모에서 자식으로 downcating하고 호출해야됨
		
	} 	

}
