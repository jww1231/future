package mirae.com;
import java.util.Scanner;
public class a_05_if_test {
	public static void main(String[] args) {
		// Heap 
		// 표준입력장치 : 키보드
		Scanner input = new Scanner(System.in);// 클래스를 인스턴스한다
		System.out.println("월을 입력하시오");
		int month = input.nextInt();
		String season = null; // null은 기억공간을 확보하지 않은 변수 ""아무것도 없는것 " "공백도 문자이다 null과의 차이점
		// 컴퓨터 프로그램은 경우의 수를 확인해서 다처리해야한다
		/*
		if (month == 12 || month == 1 || month == 2) {
			season = "겨울";
		} else if (month == 3 || month == 4 || month == 5) {
			season = "봄";
		} else if (month == 6 || month == 7 || month == 8) {
			season = "여름";
		} else if (month == 9 || month == 10 || month == 11) {
			season = "가을";
		} else {
			season = " 없는 계절";
		}
		System.out.println(month + "월은 " +season+ "입니다");
		*/
		switch (month) { // 범주형데이터
		  case 12: season = "겨울";    break;
		  case 1: season = "겨울";    break;
		  case 2: season = "겨울";    break;
		  case 3: season = "봄";   break;
		  case 4: season = "봄"; break;
		  case 5: season = "봄";  break;
		  case 6: season = "여름";  break;
		  case 7: season = "여름";  break;
		  case 8: season = "여름";  break;
		  case 9: season = "가을";  break;
		  case 10: season = "가을";  break;
		  case 11: season = "가을";  break;
		  default : season = " 없는 계절";  break;
		}
		// formet의 약자 %0.2f 
		// %d는 정수 s는 string 문자열
		System.out.printf(month + "%d월은 %s 입니다. ", month, season);
		input.close(); // 자원을 사용하는 인스턴스는 반드시 해제
	}

}
