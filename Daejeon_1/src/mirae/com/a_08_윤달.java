package mirae.com;
import java.util.Scanner;
public class a_08_윤달 {
	public static void main(String[] args) {
		
		Scanner j = new Scanner(System.in);
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
				 *한번더 반복 간추림
				 
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
		// 년도와 월일 입력하면 말일이 몇일인지 알고 싶음 (31,30,2월) 케이스는 3개
		// 2월 : 4로 나누어서 떨어지고, 100으로 나누어서 떨어지지 않고 400으로 나누어서 떨어지면 윤달
		//
		
		System.out.println("년도를 입력해주세요");
		int year = j.nextInt();
		System.out.println("말일을 알고 싶은 월을 입력해주세요");
		int month = j.nextInt();
		int numDays = 0;
		
		switch (month) {

		case 1 : case 3 : case 5 :
		case 7 : case 8 : case 10 :
		case 12 :
			numDays = 31;
			break;
			
		case 4 : case 6 :
		case 9 : case 11 :
			numDays = 30;
			break;
		case 2 : 
			//         true/false       // true/false
			if (((year %4 == 0)&& !(year % 100 == 0)) || (year% 400 == 0))
					// 나머지가 0인경우 나누어서 떨어진경우
				
				numDays = 29; // 윤달
			else 
				numDays = 28; // 윤달이 아닌 경우
			
			break;
		default : 
			System.out.println("해당 월이 없습니다.");
			break;
		}
		System.out.println(year + "년 " + month + "월의 말일은 " + numDays + "일 입니다. " );
		
	}

}
