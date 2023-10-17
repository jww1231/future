package mirae4.com;

import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedList;

class Dept2{// class 생성
	int deptno;
	String dname;
	String loc;
	
	Dept2(int deptno, String dname, String loc){
		this.deptno= deptno;
		this.dname=dname;
		this.loc = loc;
	}
	
	public Integer getDeptno() {
		return Integer.valueOf(deptno);
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public String toString() {
		return "부서번호:" + deptno + " 부서이름:"+ dname + " 위치:"+loc;
	}
}
public class e_08_LinkedList {
	public static void main(String[] args) {

		Dept2 s1 = new Dept2(10, "회계사", "서울");
		Dept2 s2 = new Dept2(20, "연구원", "대전");
		Dept2 s3 = new Dept2(30, "판매원", "충주");
		Dept2 s4 = new Dept2(40, "운영부", "부산");
		Dept2 s5 = new Dept2(50, "회계사", "수원");
		LinkedList<Dept2> al = new LinkedList<Dept2>();
		al.add(s1);
		al.add(s2);
		al.add(s3);
		al.add(s4);
		al.add(s5);
		Iterator<Dept2> itr=al.iterator();
		while (itr.hasNext()) {
			Dept2 dept2 = (Dept2)itr.next();
			System.out.println(dept2);
			
		}
		LinkedList<Dept2> al2 = new LinkedList<Dept2>();
		al2.add(s1);
		al2.add(s2);
		al.addAll(al2); // 리스트를 다른 리스트에 추가
		System.out.println(al2);
		System.out.println(al);
		al.remove(0); // 10
		al.removeAll(al2);// 있는것을 다 지움
		System.out.println(al);
		al.addFirst(s1);
		al.addLast(s2);
		System.out.println(al);
		al.removeFirst();
		al.removeLast();
		System.out.println(al);
		al.removeFirstOccurrence(s1); // 처음 발견되는 데이터
		al.removeLastOccurrence(s2);  // 마지막에 발경되는 데이터
		System.out.println(al);
//		al.clear();
		System.out.println("역순으로 출력하기");
		// ascending 오름차순
		// descdending 내림차순
		Iterator reverse_iter = al2.descendingIterator();
		while (reverse_iter.hasNext()) {
			Dept2 dept2 = (Dept2) reverse_iter.next();
			System.out.println(dept2.deptno + " " +
					dept2.dname + " " +dept2.loc);
		}
		// generic 자료구조에서는 기본데이터 타입을 사용할 수 없음
		// 사용자 정의 데이터 타입인 클래스인 경우 정렬할 때는 기준이 필요 : 클래스에서는 비교를 할 수 있도록 Comparator 를 제공해야 함
		// String, Integer 인 경우 이미 존재한다
		Comparator<Dept2> comp= new Comparator<Dept2>() {
			public int compare (Dept2 u1, Dept2 u2)
			{
				return u1.getDeptno().compareTo(u2.getDeptno());
			}
		};
		// 정렬은 두개의 데이터를 비교
		Collections.sort(al,comp);
		int index = Collections.binarySearch( al, new Dept2( 30,null,null), comp);
		System.out.println("이진 검색으로 찾은 인덱스 " + index);
		System.out.println("이진 검색으로 찾은 데이터 " + al.get(index));
		
		if (index != -1)
			System.out.println("이진검색으로 찾은 데이터 "+ al.get(index));// 인덱스
		else 
			System.out.println(" 검색한 데이터가 없습니다");
		al.get(index).setLoc("대전");
		
		//문제 50번 데이터를 삭제하시오
		index = Collections.binarySearch( al, new Dept2( 30,null,null), comp);
		if ( index != -1 ) al.remove(index);
		else System.out.println(" 삭제할 데이터가 없습니다. ");
	
		


	}
}
// 문제: 성적클래스 번호, 이름, 국어, 수학, 영어
// ArrayList를 자료 구조로 해서 입력
// CRUD 함수를 만들어서 데이터를 관리하도록 메뉴화하시오
