package mirae2.com;

import java.util.Scanner;

public class jobuel_subject {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		System.out.println("가위바위보 게임입니다");
		int count = 0;
		int win = 0;
		int draw = 0;
		int lose = 0;

		while (true) {
			System.out.println("가위 (0), 바위 (1), 보 (2) 중에 하나를 입력하시요 ");
			int person = Integer.parseInt(input.nextLine());
			if (person == 9)
				break;
			int com = (int) (Math.random() * 10) % 3;
			String[] judge = { "이겼습니다\n", "졌습니다\n", "비겼습니다\n" };
			//------------------
			int result = hamsu(person, com);

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

			System.out.println("게임결과 : " + judge[result]);
		}

		System.out.println("----- 게임결과 : " + count + "전 " + win + "승 " + draw + "비김 " + lose + "패. ------\n");
	}

	public static int hamsu(int person, int com) {
		if (person == com)
			return 2;
		if (person == 0 && com == 2 || person == 1 && com == 0 || person == 2 && com == 1)
			return 0;
		return 1;
	}
}