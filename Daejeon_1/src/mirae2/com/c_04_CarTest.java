package mirae2.com;

public class c_04_CarTest {

	public static void main(String[] args) {
		 Car [] cars = new Car[3];	// Student 90	 
		 cars[0] = new Car("소나타"); // Scanner
		 cars[1] = new Car("아반테");
		 cars[2] = new Car("아우디");
		 for(int i = 0; i< cars.length; i++) {
			 cars[i].drive();
		 }
		 // 주말과제
		 // CRUD 입력, 출력, 수정
		 // 메뉴화
		 // 메뉴 (1:입력, 2: 출력, 3: 수정  9:종료)
		 
		 // 팀 : 가위바위보 게임( 객체 3개 :  comp (랜덤) , player(입력) , judge(판단))
		 // 게임 승패 결정
	}

}
