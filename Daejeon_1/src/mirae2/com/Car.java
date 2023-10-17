package mirae2.com;

public class Car {
	public String name;
	public Car() {}
	public Car(String name) {
	   	this.name = name ;
	}
	public void drive() {
		System.out.println(this.name + "이 달려갑니다. ");
	}

}
