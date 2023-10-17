package mirae3.com;
//사원관리(Employee 이름name 나이age 성멸sex 주소addr 급여salary

//이를 클래스로 작성하시오
//출력함수 display

//사원클래스를 상속받은 Manager class를 작성하시오
//부서명이 추가된다 department
//사원배열

class Employee {
	String name;
	int age;
	String sex;
	String addr;
	long salary;

	public Employee() {
	}

	public Employee(String name, int age, String sex, String addr, long salary) {
		this.name = name;
		this.age = age;
		this.sex = sex;
		this.addr = addr;
		this.salary = salary;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public long getSalary() {
		return salary;
	}

	public void setSalary(long salary) {
		this.salary = salary;
	}

	public void display() {
		System.out.println("이름:" + name + "나이:" + age + "성별:" + sex + "주소:" + addr + "급여:" + salary);
	}
}

class Manager extends Employee {
	public String department;
	public Employee sub[]; // 관리하는 직원

	public Manager() {
	}

	public Manager(String name, int age, String sex, String addr, long salary, String department) {
		super (name, age, sex, addr, salary);// 부모의 생성자를 호출하는 방법
//		this.name = name;
//		this.age = age;
//		this.sex = sex;
//		this.addr = addr;
//		this.salary = salary;
		this.department = department;
		this.sub =new Employee[2];
		
	}

	public void displayEmployee() {
		for (int i = 0; i < sub.length; i++) {
			sub[i].display();
		}
	}

	public void display() {
		System.out.println("담당부서:" + this.department);
		System.out.println("부하직원의 수:" + this.sub.length);
		System.out.println("부서장");
		super.display();
		System.out.println("부서직원");
		displayEmployee();
	}
}
	public class d_04_company {

		public static void main(String[] args) {
			Employee e11 = new Employee("대한이", 23, "남", "서울시 강북구", 1500000);
			Employee e12 = new Employee("민국이", 35, "남", "대전시 쌍용동", 2500000);
			Employee e14 = new Employee("희망이", 23, "남", "서울시 강북구", 1500000);
			Employee e15 = new Employee("하면됨", 35, "남", "대전시 쌍용동", 2500000);

			Manager[] co = new Manager[2];
			Manager ma1 = new Manager("김관리", 40, "여", "서울시 강남구", 5000000, "개발부");
			ma1.sub[0] = e11;
			ma1.sub[1] = e12;
			Manager ma2 = new Manager("이소정", 40, "여", "서울시 영등포", 5000000, "연구부");
			ma2.sub[0] = e14;
			ma2.sub[1] = e15;
			co[0] = ma1;
			co[1] = ma2;
			System.out.println("전체 직원현황");
			for (int i = 0 ; i < co.length; i++) {
				co[i].display();
			}
		}
	}
