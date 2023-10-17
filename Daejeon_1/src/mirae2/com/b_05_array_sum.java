package mirae2.com;

public class b_05_array_sum {

	public static void main(String[] args) {
		int temp[] = { 10, 20, 30, 40 };
		int temp2[] = { 100, 200, 300, 400, 500 };
		// 문제 배열 데이터를 받아서 합계를 낸 다음 리던하는 함수를 작성하시오
		int hab = sumArray(temp);
		System.out.println("배열의 합계 = " + hab);
		hab = sumArray(temp2);
		System.out.println("배열의 합계 = " + hab);
		
	}
		public static int sumArray(int temp[]) {
			int hab = 0;
			for ( int i = 0; i< temp.length ; i ++) {
				hab += temp [i];
			}
			return hab;
	
		
		


	}
}