package mirae2.com;

public class Person {
	public String name;
	public int age;

	public Person(String name, int age) {
		this.name = name; // this는 인스턴스 하고 나서의 자기 자신이다.
		this.age = age;
	}

	// get/set
	public void setName(String name) { // void는 리턴을 하지 않는 경우 /리턴값이 없다
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setAge(int age) {
		if (age > 200)
			age = 200; // 데이터 보호를 위해서 함수로 제한
		this.age = age;

	}

	public int getAge() {
		return age;
	}

	public void print() {
		System.out.println("이름은 " + this.name + " 나이는 " + this.age);
	}
}
