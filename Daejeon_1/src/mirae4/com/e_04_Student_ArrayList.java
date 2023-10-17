package mirae4.com;

import java.util.ArrayList;
import java.util.Iterator;

// Student21
// int rollno, String name, int age
// arraylist에 3인분을 입력하고 출력해보시요 ( 출력방식은 4가지 ( for, for:, iterator, forEach)
class Student21{
	public int rollno;
	public String name;
	public int age;
	public Student21() {}
	public Student21(int rollno, String name, int age) {
		this.rollno = rollno; this.name=name; this.age = age;
	}
	public int getRollno() {
		return rollno;
	}
	public void setRollno(int rollno) {
		this.rollno = rollno;
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
	public String toString() {
		return "번호:" + rollno + " 이름:"+name + " 나이:" + age;
	}
}
public class e_04_Student_ArrayList {
	public static void main(String[] args) {
		Student21 s1 = new Student21(101, "고구려", 23);
		Student21 s2 = new Student21(102, "대발해", 21);
		Student21 s3 = new Student21(103, "왕대한", 25);
		ArrayList<Student21> al = new ArrayList<Student21>();
		al.add(s1);
		al.add(s2);
		al.add(s3);
		for(int i=0; i < al.size(); i++) {
			System.out.println(al.get(i));
		}
		System.out.println(al);
		for(Student21 stu:al) {
			System.out.println(stu);
		}
		Iterator itr = al.iterator();  
		while (itr.hasNext()) {
			Student21 st = (Student21) itr.next();
			System.out.println(st.rollno + " " + st.name + " " + st.age);
		}
		al.forEach(a -> {
			System.out.println(a.rollno + " " + a.name + " " + a.age);
		});
		al.forEach(f -> System.out.print(f));
		itr = al.iterator();  
		int totalage =0;

		while (itr.hasNext()) {
			Student21 st = (Student21) itr.next();
			totalage += st.age;
		}
		System.out.println("나이의 총합계:" + totalage);
	}
}