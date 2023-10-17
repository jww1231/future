package mirae.com;

public class a_10_for {

	public static void main(String[] args) {
		/*
		 * for (int i = 1; i<=10; i++) { System.out.println(i); } for(int i=1;
		 * i<=10;i++) { if(i==5) { continue; / break; / continue는 5만 제외됨 둘다 가능함 break는
		 * 4까지만 나옴 } System.out.println(i);
		 */
		// 배열 2중 포문과 동일함
		// 배열 : 자바는 행중심 배열
		// 인덱스를 사용하는 방법 : 1) 배열의 인덱스 2) 반복회수 3) 값으로 사용
		int hab = 0;
		int[][] data = { { 1, 2, 3 }, { 4, 5, 6 }, { 7, 8, 9 } };
		// {1,2,3}
		// {4,5,6}
		// {7,8,9}
		for (int i = 0; i < 3; i++) { // 2중 for문 = 2차원 배열 // outer for문
			for (int j = 0; j < 3; j++) { // inner for문
				System.out.println(i + " " + j);
				hab += j;
				// (1,2)인 데이터만 처리에서 제외시키시요
				System.out.println(data[i][j]);

				if (i == 5 && j == 2) {
					continue;

				}
			}

		}
		int i=1; // 초기값
		while(i<=10) { // 한계값 : True
			System.out.println(i);
			i++; // 증강값
		}
		
		   i=1;// 초기값
		   do { // 반드시 한번은 실행함
		     
			System.out.println(i);
			i++; // 증강값
		
		}while(i<=10) ; // 한계값 : True
	}
}

