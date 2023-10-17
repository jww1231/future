package mirae3.com;
//abstract(일부함수가 구현이 안된것) 와 interface(모든 함수가 구현이 없는것)

//자바에서는 구현이 안된 함수에는 abstract를 붙여야함
//abstract class: 추상클래스
//추상클래스는 인스턴스 할 수 없음(프로그램 중단됨) 다만 부모는 가능함
// 왜 추상함수를 만드는가?
// 상속받은 자식이 반드시 재정의 하라고

abstract class Weapon {// 추상클래스
	public void prepare() {
		System.out.println("무기 작동을 준비 합니다.");
	}

	public abstract void attack();// 추상함수 반드시 재정의
}

class MyWeapon extends Weapon {
	@Override // 재정의 할때는 오버라이드를 적는다 (annotation)
	public void attack() {
		System.out.println("김구라를 공격해요");
	}
}

class YourWeapon extends Weapon {
	@Override
	public void attack() {
		System.out.println("원숭이를 공격해요");
	}
}

public class d_09_abstract {

	public static void useWeapon(Weapon w) {
		w.prepare();
		w.attack();
	}

	public static void main(String[] args) {
		// Weapon we = new Weapon(); 추상클래스는 인스턴스가 안됨
		Weapon we = new YourWeapon(); // 부모로서 자식을 가리킬 수 있음 
		MyWeapon w1 = new MyWeapon();
		w1.prepare();
		w1.attack();
		YourWeapon w2 = new YourWeapon();
		w2.prepare();
		w2.attack();
		
		useWeapon(w1);
		useWeapon(w2);
		
	}

}
