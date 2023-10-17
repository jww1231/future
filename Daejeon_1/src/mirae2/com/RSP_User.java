package mirae2.com;

import java.util.Scanner;

// 가위바위보 중에 하나를 입력 결과
// Scanner : 종료조건이 확인되어야 한다

public class RSP_User { 
	String temp = ""; // 변수는 초기화 하지 않고 사용하면 참조형은 에러나 참조형이 아닌것은 쓰레기가 발생한다
	int input = 0;
	Scanner person;
	public RSP_User() {}// 생성자는 리턴값이 없음
	// 디폴트 생성자가 있어야 하는 이유 : 클래스 배열에서 필요로 함
	public RSP_User(int input) {
		// overloading : 함수이름은 같은데 매개변수 타입이나 매개변수 개수가 다를 떄
		// 다른 함수로 인식하는 것
		// 오버로딩을 하는 방식 (함수이름은 같게 (매개변수는 타입이 다르거나 개수가 다르게)
		this.input = input;
	}
	public int getUser() {
		System.out.println("가위(0), 바위(1),  보(2)중 선택 종료 (-1)" );
		person = new Scanner(System.in);
		temp = person.nextLine();
		if (temp==null || temp.equals("-1")) {
			return -1;
		}
		input = Integer.parseInt(temp);
		input = input % 3;
		return input;
	}

}
