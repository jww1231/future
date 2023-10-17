package mirae3.com;
//인터페이스도 인스턴스는 안됨 그러나 부모로서 자식을 가리킬 수는 있음
//인터페이스는 다중상속(implements)이 가능
interface MyInterface {
	public String hello = " 인터페이스 변수는 기본으로 public static final" + "접근이 가능";
	public void sayHello(); // {} 구현부가 없는것
}
class MyInterfaceImpl implements MyInterface{
	public void sayHello() {
		System.out.println(MyInterface.hello);
	}
}

public class d_10_interface {
	public static void main(String[] args) {
		System.out.println(MyInterface.hello);
		MyInterface myinterface = new MyInterfaceImpl();
		myinterface.sayHello();
		
		MyInterface [] mydim = new MyInterface[2];
		mydim[0] = new MyInterfaceImpl();
		mydim[1] = new MyInterfaceImpl();
	}

}
