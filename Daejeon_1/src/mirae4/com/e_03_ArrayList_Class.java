package mirae4.com;

import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

class MemberDto { // Object : clone, equals 값비교( == 주소비교), toString : 참조형으로 클래스를 관리
	
	public static int hab=0; // 한번만 만들어지는 변수임 (공용변수)
	// ex)성적프로그램에서는 학교나 학생수 
	public int num;
	public String name;
	public String addr;

	public MemberDto() {
	}

	public MemberDto(int num, String name, String addr) {
		super(); // 부모 생성자 호출을 습관으로
		this.num = num;
		this.name = name;
		this.addr = addr;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String toString() {
		return "번호:" + num + " 이름:" + name + " 주소:" + addr;
	}

}

public class e_03_ArrayList_Class {

	public static void main(String[] args) {
		// List 왼쪽과 오른쪽 != ArrayList
		// 부모와 자식관계
		// 부모가 대신 가리킬때는 부모에 있는 내용만 가능

		List<String> names = new ArrayList<String>();
		names.add("김구라");
		names.add("해골");
		names.add("원숭이");
		for (int i = 0; i < names.size(); i++) {
			String tmp = names.get(i);
			System.out.println(tmp);
		}
		for (String tmp : names) { // 확장for문 tmp에서 실제객체가 튀어나온다
			System.out.println(tmp);
		}

		MemberDto dto1 = new MemberDto(1, "김일", "둔산동");
		MemberDto dto2 = new MemberDto(2, "해골", "행신동");
		MemberDto dto3 = new MemberDto(3, "", "상도동");

		ArrayList<MemberDto> members = new ArrayList<MemberDto>(); // 여기서 정의함 members
		members.add(dto1);
		members.add(dto2);
		members.add(dto3);
		System.out.println("ArrayList 출력 ");
		System.out.println("\t" + members);

		for (int i = 0; i < members.size(); i++) {
			System.out.println(members.get(i)); // 문자열은 to스트링을 만들어놔서 위에 함수대로 출력됨
		}
		// 첫번재 데이터를 가리키는 포인터를 알려줌
		ListIterator<MemberDto> listIterator2 = members.listIterator();
		while (listIterator2.hasNext()) { // hasnext는 확인함수
			System.out.println(listIterator2.next()); // next는 데이터를 선택
		}
		while (listIterator2.hasNext()) { //
			System.out.println(listIterator2.next());
			// 이건 끝나서 출력이 안됨
		}
		while (listIterator2.hasPrevious()) { // hasnext는 확인함수
			System.out.println(listIterator2.previous()); // next는 데이터를 선택
		}
		while (listIterator2.hasNext()) { // hasnext는 확인함수
			System.out.println(listIterator2.next()); // next는 데이터를 선택
		}
		listIterator2 = members.listIterator(); // 처음을 가리킴
		while (listIterator2.hasNext()) { // hasnext는 확인함수
			System.out.println(listIterator2.next()); // next는 데이터를 선택
		}
		// 구조적 프로그래밍=> 객체 지향프로그래밍-> 일반화 프로그래밍(generic) :자료구조 -> 함수화 프로그래밍은 for문이 없다
		// 함수화 프로그래밍의 매개변수로는 함수가옴
		// 자바에서는 함수하나를 만들려고 해도 class를 만들어야함
		// 예외로 람다함수를 사용한다 (간단한 함수 : 무명함수)를 사용 - 파이썬 문법
		// 다시 호출할일이 없음 ( 쓰고 버리는 놈)
        // void process(a1){System.out.println(a1.num + " " + a1.name + " " + a1.addr)};
		// c#에서는 화살표함수라고 한다 자바에서는 람다함수
		members.forEach(a1 -> {System.out.println(a1.num + " " + a1.name + " " + a1.addr);});
		// forEach가 하는것은 for문의 역할을 하면서 각 함수로 던져준다
		
		int hab = 0;
		for (int i=0; i< members.size(); i++){
			hab += members.get(i).num;
		}
		System.out.println(" 인덱스를 이용한 번호의 합은 = " + hab);
		// forEach 문을 이용해서 num의 합계를 출력해 보시요
		// static 변수가 필요함
		MemberDto.hab = 0;
		// 클래스 내부의 변수나 static 변수를 사용해서 누적처리함
		members.forEach(a1->{ MemberDto.hab += a1.num;
			
		});
		System.out.println("반복자를 이용한 번호의 합은 =" + MemberDto.hab);
	}
}
