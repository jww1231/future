package mirae2.com;

// 문제 : 이름, 국어, 영어, 수학 점수를 저장하는 클래스를 작성해보시오

// 생성자 구현
// get/set 함수 작성
// 이름 국어 영어 수학점수 출력 함수
// 배열 : 데이터 동질적

// 문제 : 총점, 평균 멤버변수를 추가하시고 데이터가 세팅될때 자동으로 총점과 평균을 계산
// 수정해보시오
public class Student {
	String name;
	int kor;
	int english;
	int math;
	int total;
	int average;

	public Student(String name, int kor, int english, int math) {
		this.name = name; // this는 인스턴스 하고 나서의 자기 자신이다.
		this.kor = kor;
		this.english = english;
		this.math = math;
		totCalc();
		avrCalc();
	}

	public Student(String name, int kor, int english) { // 내가 빠뜨린거
		this.name = name;
		this.kor = kor;
		this.english = english;

		totCalc();
		avrCalc();
	}
	public Student(String name ) { // 내가 빠뜨린거
		this.name = name;
	}

	public void setName(String name) { // void는 리턴을 하지 않는 경우 /리턴값이 없다
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setKor(int kor) {
		this.kor = kor;
		totCalc();
		avrCalc();
	}

	public int getKor() {
		return kor;

	}

	public void setEnglish(int english) {
		this.english = english;
		totCalc();
		avrCalc();

	}

	public int getEnglish() {

		return english;
	}

	public void setMath(int math) {
		this.math = math;

		totCalc();
		avrCalc();
	}

	public int getMath() {
		return math;

	}

	public void print() {
		System.out.println(
				"이름은 " + name + " 국어점수는 " + kor + " 영어점수는 " + english + " 수학점수는 " + math + " " + total + " " + average);
	}

	public void totCalc() {
		total = kor + math + english;
	}

	public void avrCalc() {
		average = total / 3;
	}

}
