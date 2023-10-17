package mirae4.com;
// 데이터 타입이 입력되는 자리에 대표 타입으로 대치
class Box<T> { // Generic class
	private T t;
	public void add (T t) {
		this.t = t;
	}
	public T get() {
		return t;
	}
}


public class e_01_box {
	// Generic function (Template in C++)
	// (), {}, [],< 데이터 타입>
	public static < E > void printArray( E[] inputArray) {
		for (E element : inputArray) {
			System.out.printf("%s ", element);
		}
		System.out.println();
	}

	public static void main(String[] args) {
		Integer[] intArray = { 1, 2, 3, 4, 5};
		Double [] doubleArray = { 1.1, 2.2, 3.3, 4.4 };
		Character [] chatArray = { 'H', 'E', 'L', 'L', 'O' };
		printArray(intArray); //  E를 -> integer // Compile time 결정
		printArray(doubleArray); //  E를 -> double
		printArray(chatArray); //  E를 -> Character 
		// 구체적인 데이터 타입 지정 : 기본형, 참조형 
		// compile time에 T를 지정된 데이터 타입으로 변환 사용
		Box<Integer> integerBox = new Box <Integer>();// 클래스 인스턴스
		Box<String> stringBox = new Box<String>();
		integerBox.add(Integer.valueOf(10));
		stringBox.add(new String("안녕 일반화 프로그램 "));
		System.out.printf("정수형 :%d\n\n", integerBox.get());
		System.out.printf("문자형 :%s\n", stringBox.get());
		
		
	}

}
