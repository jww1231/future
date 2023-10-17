package mirae.com;

import java.util.Random;

public class a_03_random {

	public static void main(String[] args) {
		// 1은 seed 값
		// new는 동적 메모리 할당 => heap에 생성
		// 주소
		// 클래스 => 사용자 정의 데이터 타입
		Random rand = new Random(10000); // 클래스 난수발생 -> 의사난수(가짜난수)
		System.out.println("= rand =");
		rand.nextInt();
		// 차이점
		// int i = 0;
		for (int i = 0; i <= 10; i++)// 초기값, 한계값, 증감값
			System.out.println(i + ":" + rand.nextInt());

		// 대한민국을 10번 출력하시오
		for (int i = 1; i <= 10; i++)// 초기값, 한계값, 증감값
			System.out.println("대한민국");

		// 1~10까지의 합
		// i는 증가변수
		// 누적변수
		int hab = 0;
		// i = i + 1; 증가변수
		// 홀수의 합 for (int i = 1; i <= 10; i=i+2)
		// 짝수의 합 for (int i = 0; i <= 10; i=i+2)
		for (int i = 0; i <= 10; i=i+2) { // 1,2,3,4,5,6,7,8,9,10
			hab = hab + i; // 1,3,6,10,15,21,28,36,45,55
			System.out.println(hab);
		}
		// 5050, 500500, 50005000
		System.out.println(hab);
		// 컴퓨터의 괄호 
		// ()소괄호:함수, {}중괄호:블록, []대괄호:배열
		int [] counter = new int [10]; // 힙에 10개의 int형을 저장하는 메모리를 확보해라
		// 0,1,2,3,4,5,6,7,8,9
		// 1,2,3,4,5,6,7,8,9,10
		for (int i = 0; i < 10; i++) { // 값 대입
		    counter[i] = i+1;
		}
		for (int i = 0; i < 10; i++) { // 값 출력
			System.out.println(counter[i]);
			
		}

		
		
		
		
	}

}
