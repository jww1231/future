package mirae.com;

public class a_17_average {

	public static void main(String[] args) {

		// 3*4
		int[][] sungjuk = { { 90, 90, 90, 0 }, { 89, 89, 89, 0 }, { 90, 99, 99, 0 } };

		// 합계
		// 평균
		double[] avr = new double[3];

		for (int i = 0; i < sungjuk.length; i++) {
			int tot = 0;
			for (int j = 0; j < sungjuk.length - 1; j++) {
				tot += sungjuk[i][j];
			}
			sungjuk[i][3] = tot;
			// 97.123 => 9712=> 97.12
			avr[i] = Math.round(tot / 3 * 100) / 100;
		}
		String[] name = {"대한", "민국", "만세"};
		System.out.println("이름 국어 영어 수학 합계 평균");
		for (int i = 0; i < sungjuk.length; i++) {
			System.out.print(name[i] + "  ");
			for (int j = 0; j < sungjuk[0].length - 1; j++) {
				System.out.print(sungjuk[i][j] + "  ");
			}
			System.out.print(avr[i]); 
			System.out.println();
		}
		
	}

}
