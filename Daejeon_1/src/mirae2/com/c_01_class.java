package mirae2.com;

// 자바 규칙 : 하나의 파일에 하나의 클래스만 존재
// 클래스 이름하고 파일 이름이 동일해야한다
// 이 파일내에서만 사용가능 ( 학습용 )    
/*class Person { // private class // 기본꼴
	// 멤버 변수, 멤버 함수, 생성자 (초기화)
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
} // 
*/
// 클래스는 사용자 정의 데어터 타입
// 함수는 한번만 정의되고 데이터는 인스턴스할때 마다 공간을 확보하게 됨

// 호출 추상화 
public class c_01_class {
	public static void main(String[] args) {
		Person pe1 = new Person("대한이", 21);
		Person pe2 = new Person("민국이", 19);
		Person pe3 = new Person("만세야", 18);
		pe1.print();
		pe1.print();
		pe1.print();
		pe2.print();
		pe3.print();
		Person[] pe_dim = new Person[4];   // 주소가 3개 입력될 공간확보
		pe_dim[0] = new Person("대한이", 10); // 실제 데이터를 가진 공간
		pe_dim[1] = new Person("민국이", 11); //
		pe_dim[2] = new Person("대한", 12);  //
		pe_dim[3] = new Person("김종호", 40); //
		for (Person pe : pe_dim) {
			pe.print();
		}
		String st_arr[] = { "대한이", "민국이", "만세"	};
		int age_arr[] = {10,11,12};
		
		Person[] pe_arr = new Person[st_arr.length];// 주소공간 확보
		for ( int i = 0 ; i<st_arr.length; i++) {
			pe_arr [i] = new Person(st_arr[i], age_arr[i]); // 데이터 공간확보
		}
		for ( Person pe: pe_arr ) {
			pe.print();
		}
	}
}
