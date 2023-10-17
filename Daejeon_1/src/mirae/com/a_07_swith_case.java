package mirae.com;

import java.util.Scanner;

public class a_07_swith_case {

	public static void main(String[] args) {

		Scanner input = new Scanner(System.in);
		/*int day;
		System.out.println("날짜를 입력하시오(1~31)");
		day = input.nextInt();
		day = day % 7 + 1;
		String weekday = "";
		switch (day) {
		case 1 : weekday = "월요일"; break;
		case 2 : weekday = "화요일"; break;
		case 3 : weekday = "수요일"; break;
		case 4 : weekday = "목요일"; break;
		case 5 : weekday = "금요일"; break;
		case 6 : weekday = "토요일"; break;
		case 7 : weekday = "일요일"; break;
		} 
		System.out.println("오늘은"+ weekday + "입니다"); */
		
//**************************************************************************************
		
		// 문제 : 점수를 입력받고 학점으로 변환해서 출력
		// 90~100 A학점 
		// 80~ 89 B학점
		// 70~ 79 C학점
		// 60~ 69 D학점
		// 그 외는 F학점
		// 100/10 => 10
		// 90~99/10 => 9 몫을 사용해서 처리
		
		/* System.out.println("점수를 입력하시오(1~100)");
		int jumsu;
		char grade = ' ';// 공백도 문자, char는 초기화 되어야 함
		jumsu = input.nextInt();
		jumsu = jumsu / 10 ;
		
		switch (jumsu) {
		case 10 : grade = 'A'; break;
		case 9 : grade = 'A'; break;
		case 8 : grade = 'B'; break;
		case 7: grade = 'C'; break;
		case 6 : grade = 'D'; break;
		default : grade = 'F'; break;
		}
		System.out.println( "당신의 학점은 "+ grade + " 입니다"); 
//**************************************************************************************
		 *한번더 반복
		 
		System.out.println("점수를 입력하시오(1~100)");
		int jumsu = input.nextInt();
		char grade = ' '; // 공백도 문자, char는 초기화 되어야 함
		 
		switch (jumsu/ 10) {
		case 10 : 
		case 9 : grade = 'A'; break;
		case 8 : grade = 'B'; break;
		case 7 : grade = 'C'; break;
		case 6 : grade = 'D'; break;
		default : grade = 'F';  
		}
		System.out.println( "당신의 학점은 "+ grade + " 입니다"); */
//**************************************************************************************		
		// 년도와 월일 입력하면 말일이 몇일인지 알고 싶음
		// 2월 : 4로 나누어서 떨어지고, 100으로 나누어서 떨어지지 않고 400으로 나누어서 떨어지면 윤달
		//
		
		
		
	}

}
