package mirae.com;

import java.util.Scanner;

public class a_06_if_test2 {

	public static void main(String[] args) { // 컨트롤 쉬프트 알파벳 오로 임폴트값 진행
		// 클래스는 사용자정의 데이터타입 (멤버변수, 멤버함수(클래스 정의시 한번만 정의됨))
		Scanner input = new Scanner(System.in); // 표준입력장치:키보드
		// 필요한 데이터는 heap에 생성
		// input에는 주소가 들어있음
		/*
		 * System.out.println("홀짝 판정을 위한 숫자를 입력하시요"); int num = input.nextInt();// 정수형
		 * 데이터 입력받을 때 사용 if (num % 2 == 0) // %는 나머지 연산자 -> 경우의 수를 생성할 때 사용
		 * System.out.println("짝수입니다."); else System.out.println("홀수 입니다.");
		 */
		// if / else if / else
		// 헌혈 18세 이상이어야 하고 체중이 50kg 이상이어야 함
		// 헌혈이 가능한경우 / 나이가 미만인 경우 / 체중이 미만인경우 / 나이와 체중이 미만
		// 변수 : 나이변수 , 체중변수
		// 관계연산자 >= , && (and 논리연산)
		// if 경우의 수, for 회수 조정

		/*
		 * int wight = input.nextInt(); int age = input.nextInt(); if (age >= 18 &&
		 * wight >= 50) { System.out.println("헌혈이 가능합니다."); } else if (age < 18 && wight
		 * >= 50) { System.out.println("나이가 미달입니다."); } else if (age >= 18 && wight <
		 * 50) { System.out.println("체중이 미달입니다."); } else {
		 * System.out.println("나이와 체중이 미달입니다.");
		 * 
		 * }
		 */
		/*
		 * if (age >= 18) {{ if (wight >= 50) System.out.println("헌혈이 가능합니다."); } else {
		 * System.out.println("체중이 미달입니다."); } else {
		 * System.out.println("나이와 체중이 미달입니다."); }}
		 * 
		 * 
		 * // 문제 : 주급 40시간 까지는 시간당 100,000으로 계산하고 // 40시간 초과인 시간에 대해서는 150,000으로 계산하시오
		 * // 주 작업시간을 입력하면 계산된 주급을 출력하시오
		 * 
		 * System.out.println("이번주 작업시간을 입력해주세요");
		 */
		
		System.out.println("주 근무시간을 입력해주세요");
		int hours;
		int pay;
		final int basictime = 40;
		final int paypertime = 100000;
		final int payovertime = 150000;

		

		hours = Integer.parseInt(input.nextLine());

		if (hours > basictime) {
			pay = basictime * paypertime;
			pay += (hours - basictime) * payovertime;
		} 
		else {
			pay = hours * paypertime;
		}
		System.out.printf("당신의 주급은 %d원 입니다.\n", pay);
		input.close();

	}

	/*
	 * if (work > 40) { System.out.println("주급은 " + work * 100000 + "원 입니다. "); }
	 * else { System.out.println("주급은 " + (( work * 100000 ) + (work - 40) * 150000)
	 * + " 원 입니다. "); }
	 */
}

