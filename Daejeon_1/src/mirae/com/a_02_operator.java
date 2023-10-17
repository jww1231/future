package mirae.com;

public class a_02_operator {

	public static void main(String[] args) { // 메인도 함수
		// stack에 필요한 데이터를 가지고 있어야 한다.
		int i = 5; // 데이터 타입, 변수, 초기화 값
		// 변수명은 데이터를 알아볼수 있는 단어
		// 영문자로 시작 숫자를 사용 특수문자 ( $,_)
		// System 과 같이 이미 사용되는 키워드를 사용하면 안됨
		i++;// 후위
		System.out.println(i); // 6
		i = 5; // 데이터 수정
		++i; // 6
		System.out.println(i); // 6
		// 패키지.클래스.함수
		System.out.println(i++); // 6
		System.out.println(++i); // 8
		// Math는 static class임
		System.out.println("십의 삼승 " + Math.pow(10, 3));
		int j = 0;
		System.out.println(10 > 1);
		System.out.println(j++ + 10);// 단항연산자가 우선순위가 높다.
		System.out.println(j);

		// 데이터 변환
		// Byte(1바이트), Short(2바이트 : 65536), Int(4바이트), Long(8바이트)
		// 사이즈, 입력되는 데이터의 한계,
		// wrapper class Byte, Short, Integer, Long
		// Float(4바이트), Double(8바이트)
		int number_1 = 300;
		// 문자열 String도 class
		// class = 멤버변수 + 멤버함수
		String s = String.valueOf(number_1); // 형변환
		System.out.println(i + 100);
		System.out.println(s + 100); // 문자열 덧셈연산

		String si = "200";
		int number = Integer.parseInt(si); // 반드시 숫자만 있어야함
		System.out.println(si); // 문자열
		System.out.println(number); // 숫자로 출력

		byte iByte = 10; // 256가지
		short iShort = 10; // 65536개 표현
		int iInt = 10; // 4
		long iLong = 10; // 8
		int tmp = iByte; // 가능
		byte tmp2 = (byte) iInt; // casting
		float num1 = 10.1f; // 4 : 지수부 10^1 가수부 0.314
		double num2 = 10.1d; // 8
		double num3 = 10.1; // 기본이 double 형
		// 문자
		char ch1 = 'a'; // single quatation
		// 문자열
		String st = "대한민국"; // double quatation
		System.out.println(st);
		
	
 // 줄이 안맞을땐 컨트롤 쉬프트 f

		char c1 = 'a'; // 소문자 a의 코드값은 97
		int j1 = c1 + 3;
		System.out.println(j1);
		char c3 = (char) (c1 + 1); // 98
		System.out.println(c3);
		// 128 64 32 16 8 4 2 1 
		//  0 0 0 0 0 0 0 0
		//  0 0 0 0 1 0 0 0          
		System.out.println(Integer.toBinaryString(8));// 1 0 0 0 
		int temp = 8 >> 2; // 0 0 0 0 0 0 1 0
		System.out.println(temp);
		System.out.println(Integer.toBinaryString(temp)); // 1 0
		// 128 64 32 16 8 4 2 1 
		//  0  1   1  1 1 0 1 1 // 123
		//  1  1   0  0 1 1 0 1 // 205
		// &0  1   0  0 1 0 0 1
		int x = 123;
		int y = 205;
		
		System.out.println(Integer.toBinaryString(x));
		System.out.println(Integer.toBinaryString(y));
		int z = x&y; // && 논리and 연산자 , & 비트and 연산자 
		System.out.println(Integer.toBinaryString(z));
		System.out.println(z);
		
		
		// 3항 연산자
		x =  10;
		y = -10;        // true:false    
		int absX = (x >= 0) ? x : -x; // true
		int absY = (y >= 0) ? y : -y; // false
		System.out.println("x= "+absX);
		System.out.println("y=-"+absY);
		
	} 

}