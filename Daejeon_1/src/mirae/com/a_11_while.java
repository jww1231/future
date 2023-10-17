package mirae.com;

import java.util.Scanner;

public class a_11_while {

	public static void main(String[] args) {
		
		/*System.out.println("숫자 하나를 입력하시오 3번이상 못맞출경우 중지됩니다");*/
		// Math.random 은 0.1121323312 * 100
		// 제일 큰수가 0.99 * 100 1~ 100
			int answer = (int) (Math.random()*100)+1;
			int input = 0;
			int count = 0;
			Scanner sc = new Scanner (System.in);
			
			do {
				count++;
				input = sc.nextInt();
				
				if (answer > input) {
					System.out.println("숫자가 너무 작습니다. ");
				}else if (answer < input) {
					System.out.println("숫자가 너무 큽니다. ");
				}else {
					System.out.println("정답입니다. ");
					System.out.println("입력하신 횟수는 "+ count + "입니다 ");
					break;
				}
				/*if (count > 3)System.out.println("정해진 회수를 초과하였습니다.");
				break;*/
				
			  } while(true); // 무한루프
			  // 여러번 진행하고 싶은 경우
			  // 끝나면 전 승 패 라고 출력하고 싶은 경우 이를 구현해 보시오
			  
		
	}

}
