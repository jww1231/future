package mirae.com;

public class a_14_array {

	public static void main(String[] args) { // Block 묶음처리
		 
		int arr[] = {2, 11, 45, 9}; // 1차원
		for (int num : arr) { // 확장 for문
			System.out.println(num);
			
		}
		int [] a = new int [4];
		a[0]= 100;
		a[1]= 200;
		a[2]= 300;
		a[3]= 400;
      //a[4]= 500;
		int sum = 0;
		sum = a[0] + a[1] + a[2] + a[3];
		for (int i=0; i<a.length; i++) {
			int temp = a[i];
			sum += temp;
			System.out.println(temp);
			
		}
		System.out.printf("배열의 총합은 %d 입니다.\n", sum);
		
		int [] score = { 79, 88, 91, 33, 100, 55, 95};
		// 최대값과 최소값
		int max = score[0]; 
		int min = score[0];
		for ( int i = 1 ; i< score.length; i++) {
			if ( score[i] > max ) {
				max = score[i];
			}
			if (score[i]< min) {
				min= score[i];
			}
			System.out.println("최대값 : " + max);
			System.out.println("최소값 : " + max);
		}
	} 

}
