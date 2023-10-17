package mirae.com;

public class a_15_sort {

	public static void main(String[] args) {

		int[] number = new int[10]; // 0~9
		for (int i = 0; i < number.length; i++) {
			number[i] = i;
			System.out.print(number[i] + " ");
		}
		System.out.println("\n");
		// 데이터 섞기 ( random과 data swapping)
		for (int i = 0; i < 100; i++) {
			int n = (int) (Math.random() * 10);
			int temp = number[0]; // 0번에 잇는 숫자 백업
			number[0] = number[n];// 0을 n으로 스왑
			number[n] = temp; // 스왑 : 임시 백업(기억)공간으로 백업하고 원래자리로 넣는다
		}

		for (int i = 0; i < number.length; i++) {
			System.out.print(number[i] + " ");
		}
		System.out.println("\n");
		// bubble 정렬
		int len = number.length;
		for (int i = 0; i < len ; i++) {
			boolean changed = false;
			for (int j = 0; j < len - i - 1; j++) {
				if (number[j] > number[j + 1]) {
					int temp = number[j];
					number[j] = number[j + 1];
					number[j + 1] = temp;
					changed = true;
				}
			}
			if(!changed) break; // 변경하지 않았으면 종료
			System.out.print(number[i] + " ");

		}
		
		for (int i = 0; i < len; i++) {

		}

	}

}
