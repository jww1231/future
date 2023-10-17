package mirae4.com;

import java.util.ArrayList;

public class e_02_Arraylist {

	public static void main(String[] args) {
		int n = 10;
		// int, primitive 타입은 사용안함
		// 사이즈 자동으로 조절
		// 랜덤으로 위치 데이터를 접근 가능
		// multi thread : 동시에 실행되는 process 동시에 실행되는 작업단위
		// 속도가 빠른 cpu time을 나누어서 실행
		// ArrayList vs Vector (동기화가 가능 : 동시에 접근할 때 안전)vector는 잘 안씀

		// 배열처럼 행동하는 리스트로 구성된 배열이다
		ArrayList<Integer> arr1 = new ArrayList<Integer>(n); // +
		ArrayList<Integer> arr2 = new ArrayList<Integer>();
		System.out.println("Array 1:" + arr1);
		System.out.println("Array 2:" + arr2);
		for (int i = 1; i <= 1000; i++) {
			arr1.add(i); // 자동으로 공간을 늘려서 확보 
			arr2.add(i); // 
		}
		System.out.println("Array 1:" + arr1);
		System.out.println("Array 2:" + arr2);

	}

}
