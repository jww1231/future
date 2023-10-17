package HomeWork;
// 주말과제

// CRUD 입력, 출력, 수정
// 메뉴화
// 메뉴 (1:입력, 2: 출력, 3: 수정  9:종료) 사람 3명

import java.util.Scanner;

import mirae2.com.Person;

public class CRUD {

	public static void main(String[] args) {
		Scanner insert = new Scanner(System.in);
		int input;

		Student st1[] = new Student[3];
		while (true) {
			System.out.println("안녕하세요 성적프로그램입니다 " + "메뉴 : [1]번 입력/ [2]번 출력 / [3]번 수정 / [9]번 종료 입니다");
			input = Integer.parseInt(insert.nextLine());
			if (input == 9) {
				System.out.println("종료 되었습니다 ");

				break;
			}
			switch (input) {
			case 1: {
			    for (int i = 0; i < 3; i++) {
			        System.out.println("학생의 이름, 국어점수, 영어점수, 수학점수를 차례대로 입력하세요.");
			        String name = insert.nextLine();
			        int kor = Integer.parseInt(insert.nextLine());
			        int eng = Integer.parseInt(insert.nextLine());
			        int mat = Integer.parseInt(insert.nextLine());

			        st1[i] = new Student(name, kor, eng, mat);
			    }
			    break;
			}

			case 2: {
			    for (int i = 0; i < 3; i++) {
			        System.out.println(st1[i].getNamescore());
			    }
			    break;
			}

			case 3: {
				for (int i = 0; i < 3; i++) {
					System.out.println(st1[i].getNamescore());
				}
				for (int i = 0; i < 3; i++) {
					System.out.println("수정할 번호를 입력 해주세요 ");
					int aaa = Integer.parseInt(insert.nextLine());
					if (aaa == i + 1) {
						String name = insert.nextLine();
						int kor = Integer.parseInt(insert.nextLine());
						int eng = Integer.parseInt(insert.nextLine());
						int mat = Integer.parseInt(insert.nextLine());
						st1[i].setNamescore(name, kor, eng, mat);
					}
				}
				break;

			}

			}
		}
	}
}
