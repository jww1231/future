package mirae4.com;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

public class e_06_sort_search {

	public static void main(String[] args) {
		ArrayList<String> arraylist = new ArrayList<String>();
		System.out.println("데이터 한개를 입력하시오");
		Scanner scan = new Scanner(System.in);
		//추가 (맨뒤에)
		arraylist.add(scan.nextLine());
		arraylist.add("천안");
		arraylist.add("천안");
		arraylist.add("대전");
		// 삽입 : 인덱스 위치에 입력
		arraylist.add(2,"오리");
		arraylist.add("서울");
		System.out.println(arraylist.get(1));
		//정렬
		//Iterator -> Collections->List-> ArrayList
		//인터페이스: 약속 -> sort함수를 반드시 구현해야 하기 때문에
		Collections.sort(arraylist); //이게 구현한것 원본데이터에 작업을 한다
		System.out.println(arraylist.get(1));
		//도수
		System.out.println(Collections.frequency(arraylist, "천안"));
		//검색 (binarySearch : 전제 조건 - 정렬)
		System.out.println("검색"+Collections.binarySearch(arraylist, "오리"));
		System.out.println(arraylist); // 정렬이 되어 있음
		//삭제
		arraylist.remove("천안");
		System.out.println(arraylist);
		//수정
		arraylist.set(1, "대전");
		System.out.println(arraylist);
		

	}

}
