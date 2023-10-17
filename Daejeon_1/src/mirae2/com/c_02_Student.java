package mirae2.com;

public class c_02_Student {

	public static void main(String[] args) {
		//클래스에서는 초기화하지 않으면 자동으로 0으로 초기화된다
		 Student st1 = new Student("대한이", 100, 100, 90);
		 Student st2 = new Student("민국이", 90, 90 );
		 Student st3 = new Student("만세이");
		 st1.print();
		 st2.print();
		 st3.print();
		 
		 //문제 : 민국이의 영어점수를 88점으로 세팅
		 // 대한이의 국어 99 영어 88 수학 77
		 // 대한이의 국어점수를 80점으로 변경
		 // 대한이의 수학점수를 출력해 보시오
		 st2.setEnglish(88);
		 st2.english = 88; // 변수 public
		 
		 st3.setKor(88); st3.setEnglish(99);  st3.setMath(77);
	
	}

}
