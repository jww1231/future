package mirae4.com;

import java.util.List;
import java.util.ArrayList;
import java.util.LinkedList;

public class e_05_LinkedList_ArrayList {
	
	public static long add1(List list) {
		// 1970 .1. 1 부터  밀리세컨드로 표현된 수치
		long start = System.currentTimeMillis(); // milisecond 1/1000 초
		for (int i =0; i< 100000;i++)
			list.add(i + "");
		long end = System.currentTimeMillis();
		return end -start; // 경과시간
	}

	public static long add2(List list) {
		// 1970 .1. 1 부터  밀리세컨드로 표현된 수치
		long start = System.currentTimeMillis(); // milisecond 1/1000 초
		for (int i =0; i< 1000;i++)
			list.add(i + "X");
		long end = System.currentTimeMillis();
		return end -start; // 경과시간
	}
	public static long remove1(List list) { // 전체삭제
		// 1970 .1. 1 부터  밀리세컨드로 표현된 수치
		long start = System.currentTimeMillis();  
		for (int i =list.size() - 1; i > 0;i--)
			list.remove(i);
		long end = System.currentTimeMillis();
		return end -start; // 경과시간
	}
	public static long remove2(List list) { // 중간삭제
		// 1970 .1. 1 부터  밀리세컨드로 표현된 수치
		long start = System.currentTimeMillis();
		for (int i =0; i< 1000;i++)
			list.remove(i);
		long end = System.currentTimeMillis();
		return end -start; // 경과시간
	}

	public static void main(String[] args) {

		ArrayList a1 = new ArrayList();
		LinkedList l1= new LinkedList();
		System.out.println("= 순차적으로 추가하기 =");
		System.out.println("ArryList :" +add1(a1));   // 16
		System.out.println("LinkedList :" +add1(l1)); // 17
		System.out.println();
		System.out.println("= 중간에 추가하기 ="); // 삽입삭제는 링크드 리스트가 빠름
		System.out.println("ArryList :" +add2(a1)); 
		System.out.println("ArryList :" +add2(l1));
		System.out.println();
		System.out.println("= 중간에 삭제하기 =");
		System.out.println("ArryList :" +remove2(a1));
		System.out.println("ArryList :" +remove2(l1));
		System.out.println();
		System.out.println("= 순차적으로 삭제하기 =");
		System.out.println("ArryList :" +remove1(a1));
		System.out.println("ArryList :" +remove1(l1));

	}

}
