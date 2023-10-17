package mirae4.com;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

// 컴퓨터는 : 연산자, 제어문 ( 판단문, 반복문) : 비교연산자 , 논리연산자
class Student {
	public int no;
	public String name;
	public int kor;
	public int mat;
	public int eng;
	public int total;
	public double average;
	public int ranking;

	public Student() {
	}

	public Student(int no, String name, int kor, int mat, int eng) {
		this.no = no;
		this.name = name;
		this.kor = kor;
		this.mat = mat;
		this.eng = eng;
		calcTotal();
		calcAverage();
	}

	public Integer getNo() {
		return Integer.valueOf(no); // 자료구조에서는 기본데이터 타입은 안됨
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
		calcTotal();
		calcAverage();
	}

	public int getMat() {
		return mat;
	}

	public void setMat(int mat) {
		this.mat = mat;
		calcTotal();
		calcAverage();
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
		calcTotal();
		calcAverage();
	}

	public Integer getTotal() {
		return Integer.valueOf(total);
	}

	public double getAverage() {
		return average;
	}

	public void calcTotal() {
		total = kor + mat + eng;
	}

	public void calcAverage() {// static 함수이기 때문에 Math.는 인스턴스없이 사용가능
		average = Math.round(total / 3.0 * 100) / 100;
	}

	public String toString() { // Object 최상위 부모 : 자동출력하는 투스트링
		return " " + no + "  " + name + "  " + kor + "  " + mat + "  " + eng + "  " + total + "  " + average + " " + ranking;

	}
 

	public Comparator<Student> stdcompare() {
		Comparator<Student> comp = new Comparator<Student>() {
			public int compare(Student stu1, Student stu2) {
				return stu1.getNo().compareTo(stu2.getNo());// 오름 차순

			}
		};
		return comp;
	}
	public Comparator<Student> totalstdcompare() {
		Comparator<Student> comp = new Comparator<Student>() {
			public int compare(Student stu1, Student stu2) {
				return stu2.getTotal().compareTo(stu1.getTotal()); // 내림 차순

			}
		};
		return comp;
	}
}

public class e_09_student_menu {
	static Scanner in = new Scanner(System.in); // 외부접근 안함

	public static void inputinfo(List<Student> list) {
		// 데이터를 입력 -> Student class 작성 -> 매개변수로 넘어오는 자료구조에 전달
		Student st = new Student();
		System.out.println("번호를 입력하시오");
		st.no = Integer.parseInt(in.nextLine());
		System.out.println("이름을 입력하시오");
		st.name = in.nextLine();
		boolean re = false;
		while (!re) { // 숫자가 아닌 경우와 숫자가 범위내가 아닌경우에 필터링
			re = true;
			do {
				try {
					System.out.println("국어점수를 입력하시오");
					st.kor = Integer.parseInt(in.nextLine());
				} catch (NumberFormatException e) {
					System.out.println("숫자로 입력해주세요");
					re = false;
				}

			} while (st.kor < 0 || st.kor > 100);
		}
		System.out.println("수학점수를 입력하시오");
		st.mat = Integer.parseInt(in.nextLine());
		System.out.println("영어점수를 입력하시오");
		st.setEng(Integer.parseInt(in.nextLine()));
		// st.calcTotal();
		// st.calcAverage();
		list.add(st);
		System.out.println("데이터가 입력되었습니다.");
	}

	public static void display(List<Student> list) {
		System.out.println("*** 입력 데이터 출력 ***");
		System.out.println("번호  이름   국어   수학  영어   총점  평균  등수 ");
		Iterator<Student> itr = list.iterator();
		while (itr.hasNext()) {
			Student st = itr.next();
			System.out.println(st);
		}
	}

	public static void sort(List<Student> list) {
		Collections.sort(list, list.get(0).stdcompare());
		display(list);
	}
	public static void sort2(List<Student> list) {
		Collections.sort(list, list.get(0).totalstdcompare());
		display(list);
	}
	public static int search(List<Student> list) {
		System.out.println("검색할 번호를 입력하시오");
		int no = Integer.parseInt(in.nextLine());
		int index = Collections.binarySearch(list, new Student(no, null, 0, 0, 0), list.get(0).stdcompare());
		System.out.println("이진검색으로 찾은 인덱스 :" + index);
		if (index != -1) {
			System.out.println("검색된 데이터 ");
			System.out.println(list.get(index));
			// 수정할때도 사용
			return index;
		} else {
			System.out.println("검색한 데이터가 없습니다. ");
			return -1;
		}
	}

	public static void delete(List<Student> list) {
		int index = search(list);
		if (index != -1) {
			list.remove(index);
			System.out.println("데이터가 삭제되었습니다. ");
		} else {
			System.out.println("검색한 데이터가 없습니다");
		}
	}
	

	public static void edit(List<Student> list) {
		System.out.println("** 수정하고자 하는 이름을 입력하시오.");
		String inputValue = in.nextLine();
		Iterator<Student> itr = list.iterator();// for문 index, 확정 for문 사이에 등장하는 문법으로
		// 처음 이터레이터를 얻으면 데이터의 첫번째 데이터를 가리키게됨
		// for 문은 데이터를 인덱스로 다루는 것이고 이터레이터나 확장 for문은 데이터를 직접 가리켜서 제어함
		// 이터레이터를 쓰면 인덱스 에러가 안남 확장포문은 인덱스 에러가나서 이터레이터를 씀
		while (itr.hasNext()) { 
			Student stu = (Student) itr.next();
			if (inputValue.equals( stu.name)) {
				System.out.println(" 변경할 이름을 입력하시오.");
				String changevalue = in.nextLine();
				stu.setName(changevalue);			
			}
		}
		display(list);
		System.out.println(" ** 수정 완료 ** ");
	}

	public static void ranking (List<Student>list) {
		sort2(list);
		Iterator <Student>itr = list . iterator();
		int i = 0;
		while (itr.hasNext()) {
			Student stu = (Student) itr.next();
			i+=1;
			stu.ranking = i ; 
		}
		sort(list);
	}

	// 프로그램을 일반화 LinkedList를 쓰더라도 사용 할수 있음
	public static int windowfor(List list) {// 메뉴는 무한루프
		while (true) {
			System.out.println("=========성적관리프로그램=========");
			System.out.println("----------------------------");
			System.out.println("1.입력 2.출력 3.정렬 4.조회 5.편집 6.삭제 7.등수 .9.종료");
			System.out.println("메뉴를 선택하시오");
			int ch = 0;
			try {
				ch = Integer.parseInt(in.nextLine());
			} catch (NumberFormatException e) {

			}
			switch (ch) {
			case 1:
				inputinfo(list);
				break;
			case 2:
				display(list);
				break;
			case 3:
				sort(list);
				break;
			case 4:
				search(list);
				break;
			case 5:
				edit(list);
				break;
			case 6:
				delete(list);
				break; // 브레이크는 스위치문을 벗어남
			case 7:
				ranking(list);
				break;
			case 9:
				System.out.println(" 프로그램을 종료합니다.");
				in.close(); // 윈도우 자원을 사용하는 객체는 반드시 종료시킵니다. (네트워크, 데이터베이스, 입출력객체, 화일객체)
				return 0; // 리턴하면 함수자체를 벗어나고

			default:
				System.out.println(" 잘못 선택하였습니다.");
				break;
			}
		}

	}

	public static void main(String[] args) {
		ArrayList<Student> stud = new ArrayList<Student>();
		windowfor(stud);

	}

}

//클래스로 만들어서 실행
// 등수내는 함수 함수
// 총점을 내림차순으로 정렬 후 1~5까지 채우면된다 그 후 번호로 정렬
// 수정시 성적 수정도 추가 

// 국어 영어 수학 점수 수정가능하게 추가
// 클래 3개로 이용해서 만들기
// e 05 Linkedlist 이용해서 중간수정 만들기

