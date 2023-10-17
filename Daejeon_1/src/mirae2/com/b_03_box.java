package mirae2.com;

import java.util.Scanner;

public class b_03_box { // 클래스는 참조형변수 new를 해야함

	public static void main(String[] args) {
		// 문제 : 밑변, 넓이, 높이를 입력 받아서 부피를 계산하는 함수를 작성하고
		// 밑변 : 10, 넓이 : 20, 높이: 30인 박스의 부피 (volume)를 계산하시오
//		System.out.println("부피계산기 함수 호출 ");
//		System.out.println(fun(10, 20, 30));
//		System.out.println("계산을 종료합니다");
//
//	}
//
//	public static int fun(int a, int b, int c) {
//		int ret = (int) (a * b * c);
//		return ret;

		Scanner input = new Scanner(System.in);
		b_03_box mt = new b_03_box();// mt는 주소 : stack에 있음 // 클래스 메모리로 올리고 찾아서 사용함
		System.out.println("밑변, 넓이, 높이를 입력하시오");
		int width = input.nextInt();
		int column = input.nextInt();
		int height = input.nextInt();
		System.out.println("부피 계산 결과는 = " + mt.volume(width, column, height));
		System.out.println("부피 계산 결과는 = " + volume(width, height));
		
	}

	// 인스턴스 : 클래스가 필요한 데이터의 공간을 heap에 확보하는 일
	public int volume(int x, int y, int z) {
		int result;
		result = x * y * z;
		return result;
	}
	// 정상감형의 넓이를 구하는 공식 ( 밑변 * 높이 / 2)

	public static int volume(int width, int height) {
		int ret = width * height / 2; // 나누기가 들어가면 인트형이 자동으로 진행됨
		return ret;

	}
}
