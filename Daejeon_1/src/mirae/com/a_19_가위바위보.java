package mirae.com;

import java.util.Scanner;

public class a_19_가위바위보 {
	public static void main(String[] args) {
		// com vs person
		Scanner input = new Scanner(System.in);
		System.out.println("가위바위보 게임입니다");
		String[] judge = { "이겼습니다", "졌습니다", "비겼습니다" };
		int count = 0;
		int win = 0;
		int draw = 0;
		int lose = 0;
		// if () 문자열하고 숫자를 혼합해서 여러번 받으면 , 쓰레기로 자동입력
		
		while (true) {
			System.out.println("가위 (0), 바위 (1), 보 (2) 중에 하나를 입력하시요 ");
			int person = Integer.parseInt(input.nextLine());
			if (person == 9)
				break;
			int com = (int) (Math.random() * 100) % 3;
			// 0 1 2
			
			//------------------
			int result = 0;
			// persom com
			//    0 1 2
			// 0| 2 1 0
			// 1| 0 2 1
			// 2| 1 0 2

			if (person == 0) {
				if (com == 0)
					result = 2;
				else if (com == 1)
					result = 0;
				else
					result = 1;
			} else if (person == 1) {
				if (com == 0)
					result = 0;
				else if (com == 1)
					result = 2;
				else
					result = 1;
			} else if (person == 2) {
				if (com == 0)
					result = 1;
				else if (com == 1)
					result = 0;
				else
					result = 2;

			}
			switch (result) {
			case 0:
				win += 1;
				break;
			case 1:
				lose += 1;
				break;
			case 2:
				draw += 1;
				break;

			}
		}

	public static int doarray(int com, int person) {
				int [][]judge= {{0,1,2},{2,0,1},{1,0,2}}
				return judge[com][person];
			}

	public static int docalc(int com, int person) {
		if (com == (person % 3)) {
			return 0;
		} else if ((com + 1) % 3 == (person % 3)) {
			return 1;
		} else {
			return 2;
		}

	}

	System.out.println("게임결과 : "+judge[result]);

}System.out.println("----- 게임결과 : "+count+"전 "+win+"승 "+draw+"비김 "+lose+"패. ------\n");

}}
