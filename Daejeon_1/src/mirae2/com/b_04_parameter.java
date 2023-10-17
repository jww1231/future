package mirae2.com;
// 기본형 데이터는 값을 복사하고 (별도의 공간에 값이 존재)
// 참조형 변수는 데이터의 주소를 복사한다. ( 같은 공간의 데이터(heap)를 2개가 동시에 가리키는 형상이다.


public class b_04_parameter { // 매개변수 (parameter) : 가매개변수, 실매개 변수
	// 오버로딩
	public static void m() {}
	public static void m(int i) {i = 99;} // 기본형 - 값을 전달 : call by value
	public static void m(Integer i) {i = 99;}
	public static void m(int[] arr) {arr[0] = 99;}
	public static void main(String[] args) {
		m();
		int i = 10; //int 는 기본형
		m(i); // 복사 ( 값만 복사 )
		System.out.println(i);
		Integer val = 10;// wrapper 과도기적 언어 ( 다 클래스로 작동 )
		m(val);
		System.out.println(val); // 10 origin 값은 불변
		int[] arr = { 10, 20, 30 }; // 참조형 == 주소를 저장함
		m(arr);
		System.out.println(arr[0]); // 값이 변경
		System.out.println(arr.length);

	}
}
