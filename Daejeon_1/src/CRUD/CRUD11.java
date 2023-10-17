package CRUD;

import java.util.ArrayList;
import java.util.Scanner;

class Student99 {
	int num;
	String name;
	int kor;
	int eng;
	int mat;
	int total;
	int average;

	public Student99() {
	} // 내가 빠뜨린거 생성자

	public Student99(int num, String name, int kor, int eng, int mat)

	{
		this.num = num;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

//	public Student99(String name ) { // 내가 빠뜨린거
//		this.name = name;
//	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setKor(int kor) {
		this.kor = kor;

	}

	public int getKor() {
		return kor;

	}

	public void setEng(int eng) {
		this.eng = eng;

	}

	public int getEng() {

		return eng;
	}

	public void setMat(int mat) {
		this.mat = mat;

	}

	public int getMath() {
		return mat;

	}

}

public class CRUD11 {
	public static void Create(ArrayList al) {
		Scanner insert = new Scanner(System.in);
		for (int i = 0; i < 3; i++) {
			System.out.println("학번, 학생의 이름, 국어점수, 영어점수, 수학점수를 차례대로 입력하세요.");
			
				int num = Integer.parseInt(insert.nextLine());
				String name = insert.nextLine();
				int kor = Integer.parseInt(insert.nextLine());
				int eng = Integer.parseInt(insert.nextLine());
				int mat = Integer.parseInt(insert.nextLine());
				Student99 si = new Student99(num, name, kor, eng, mat);
				al.add(si);
			
			
		} 

	}

	public static void main(String[] args) {
		Scanner insert = new Scanner(System.in);
		ArrayList<Student99> al = new ArrayList<Student99>();

		Student99 s1 = new Student99();
		Student99 s2 = new Student99();
		Student99 s3 = new Student99();

		int input = insert.nextInt();

		while (true) {

			if (input == 9) {
				System.out.println(" 메뉴 : [1]번 입력/ [2]번 출력 / [3]번 수정 / [4]번 삭제 / [9]번 종료 입니다");
				break;
			}

			switch (input) {
			case 1: { CRUD11.Create(al);
			
			break;
			}

			case 2: {
				break;
			}

			case 3:

			{
				break;
			}
			case 4:

			{
				break;
			}
			default: {
				System.out.println("잘못된 선택입니다. 다시 선택하세요.");
				break;

			}

			}

		}

	}
}