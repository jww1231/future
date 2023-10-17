package mirae.com;

import java.util.Scanner;

public class a_12_while_game {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

//			/*System.out.println("숫자 하나를 입력하시오 3번이상 못맞출경우 중지됩니다");*/
//			// Math.random 은 0.1121323312 * 100
//			// 제일 큰수가 0.99 * 100 1~ 100
//				int answer = (int) (Math.random()*100)+1;
//				int input = 0;
//				int count = 0;
//				Scanner sc = new Scanner (System.in);
//				
//				do {
//					count++;
//					input = sc.nextInt();
//					
//					if (answer > input) {
//						System.out.println("숫자가 너무 작습니다. ");
//					}else if (answer < input) {
//						System.out.println("숫자가 너무 큽니다. ");
//					}else {
//						System.out.println("정답입니다. ");
//						System.out.println("입력하신 횟수는 "+ count + "입니다 ");
//						break;
//					}
//					/*if (count > 7)System.out.println("정해진 회수를 초과하였습니다.");
//					break;*/
//					
//				  } while(true); // 무한루프
//				  // 여러번 진행하고 싶은 경우
//				  // 끝나면 전 승 패 라고 출력하고 싶은 경우 이를 구현해 보시오

//		System.out.println("숫자 하나를 입력하시오 7번 진행되며 승패는 모든게임이 끝나면 확인가능합니다");
//
//		int answer = (int) (Math.random() * 100) + 1;
//		int input = 0;
//		int count = 0;
//		int win = 0;
//		int lose = 0;
//		int drow=0;
//		Scanner sc = new Scanner(System.in);
//
//		
//		do {
//			count++;
//			input = sc.nextInt();
//
//			if (answer > input) {
//				System.out.println("숫자가 너무 작습니다. ");
//			} else if (answer < input) {
//				System.out.println("숫자가 너무 큽니다. ");
//			} else {
//				System.out.println("정답입니다. ");
//				System.out.println("입력하신 횟수는 " + count + "입니다 ");
//				break;
//			}
//		} while (true);
//		{
//
//			if (count > 7)
//				System.out.println("정해진 횟수를 초과하였습니다.(당신은 loser)");
//			break;
//		}
		 
		int input = 0;
		int battle = 0; // 전
		int win=0; // 승
		
		String temp = "";
		while (true) { // 종료조건을 만들어야 한다

			System.out.println("게임을 하시겠습니까? (시작은 Y, 종료는 -1)");
			temp = sc.nextLine(); //문자
			if (temp.isEmpty() || temp.equals("-1")) {
				System.out.println("게임을 하시겠습니까? (시작은 Y, 종료는 -1)");
				break;
			}
			int answer = (int)(Math.random()* 100)+1;
			battle +=1;
			int count = 0;
			do {
				count++; 
				System.out.println("1~100사이의 숫자 하나를 입력하시오.");
				input = Integer.parseInt(sc.nextLine());

				if (answer > input) {
					System.out.println( answer + "숫자가 너무 작습니다. ");
				} else if (answer < input) {
					System.out.println( answer + "숫자가 너무 큽니다. ");
				} else {
					System.out.println( answer +"정답입니다. ");
					win +=1; // win = win +1 ; 증가변수
					System.out.println( answer + "입력하신 횟수는 " + count + "입니다 ");
					break;
				}
				/*
				 * if (count > 3)System.out.println("정해진 회수를 초과하였습니다."); break;
				 */

			} while (true);
			
		} System.out.printf("당신은 %d 전 %d 승 %d 패 입니다.", battle, win, battle-win);
		
	}
}
