package mirae.com;

public class a_13_star {

	public static void main(String[] args) {
		int row = 10;
//		for (int i = 0; i < row; i++) { // 10x10 행렬
//			for (int j = 0; j < row; j++) { // 종료점에 변화
//
//				System.out.print("* ");
//			}
//			System.out.println();

//		for (int i = 0; i < row; i++) { // 10x10 행렬 아래 좌측 삼각형
//			for (int j = 0 ;  j < i ; j++ ) 

		for (int i = 0; i < row; i++) { // 10x10 행렬 i가 행이고 j가 열
			for (int j = 2 * (row - i); j >= 0; j--) {
				System.out.print(" ");
			}
			for (int j = 0; j <= i; j++) {
				System.out.print("* ");
			}
			System.out.println();
		}
//----------------------------------------------------------------
		for (int i = 0; i < row; i++) {
			for (int j = row - i; j > 1; j--) {
				System.out.print("* ");
			}
			System.out.println();
		}
//----------------------------------------------------------------
		for (int first = 2; first < 10; first++) {
			for (int second = 2; second <= 9; second++) {
				System.out.printf("%2d*%d=%2d ", second, first, first * second);
			}
			System.out.println();
		}
		
//----------------------------------------------------------------
		int first =2 ;
		while (first<=9) {
			int second=1 ;
			while(second<=9) {
				System.out.printf("%2d*%d=%2d", second, first, first * second);
				second++;
			}
			first++;
			System.out.println();
		}	
	}

}
