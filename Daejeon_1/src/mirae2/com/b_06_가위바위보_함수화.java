package mirae2.com;

import java.util.Scanner;

//  
public class b_06_가위바위보_함수화 {

//	사람\컴 0가위 1바위 2보         0 이김 1짐 2 비김
//	0|가위   2(00 1(01 0(02  
//	1|바위   0(10 2(11 1(12   
//	2|보    1(20 0(21 2(22    
//	(0,0),(1,1),(2,2) = 2 =draw
//  (0,1),(1,2),(2,0) = 1 =lose 
//  (0,2),(1,0),(2,1) = 0 =win	
	
	public static int m(int person,int com) {
		// int result = 0;
		int temp [][]= {
				{ 2, 1, 0 }, 
				{ 0, 2, 1 }, 
				{ 1, 0, 2 }
			};
		//result = temp[person][com];//1바위 0가위
		return temp[person][com];
	}
	
	
	

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
			int com = (int) (Math.random() * 100) % 3;
			
			String[] judge = { "이겼습니다", "졌습니다", "비겼습니다" };
			//------------------
	
			
			int result = m(person,com);
			System.out.println("컴 : "+com);
			
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
}

