package mirae2.com;

public class b_01_function {
	public static void main(String[] args) {
		// 함수 (C) : 중복을 방지하고 알고리즘을 재사용
		// 함수 : 입력과 출력을 매핑
		// method : 클래스에 정의되어야 함 , static

//		System.out.println(100 + 300);
//		int num1 = 100;
//		int num2 = 200;
//		int result = num1 + num2;
		System.out.println("덧셈결과 : " + add(100, 200));
//		num1 = 200;
//		num2 = 400;
//		result = num1 + num2;
		System.out.println("덧셈결과 : " + add(200, 400)); // 실매개변수
		add(100, 200);
		add(200, 400);
		add(200.0f, 400.0f); // float 형
		add(200.0, 400.0);
		int result = subtract(400 , 200); // 하는 일을 이해
		System.out.println(subtract(400 , 200));
		System.out.println(result);
		
	} // add2도 가능 사용자 정의 함수

	
// static  :  함수는 클래스 내에서 선언, 클래스를 인스턴스하고 사용
// static을 사용하면 인스턴스(new) 하지 않고 사용이 가능 ( 정적 메쏘드 )
// 만약 public이 없으면 클래스 내에서만 사용하는 함수 (메쏘드)가 됨
// 오버로딩이라고 함 : 함수이름은 같은데
//		        데이터 타입이 다르거나 매개변수 개수가 다르면 다른 함수로 인식
	public static int add(int n1, int n2) { // 가매개변수
		int result = n1 + n2;
		System.out.println("덧셈결과 : " + result);
		return result;
	}

	public static float add(float n1, float n2) {
		float result = n1 + n2;
		System.out.print("덧셈결과 : " + result);
		return result;

	}

	public static double add(double n1, double n2) {
		double result = n1 + n2;
		System.out.print("덧셈결과 : " + result);
		return result;

	}

	// 문제 두수를 입력받고 곱해서 리턴하는 함수를 작성하시오
	public static int multiply(int n1, int n2) {
		int result = n1 * n2;
		return result;

	}

	public static int subtract(int n1, int n2) {
		int result = n1 - n2;
		return result;

	}
	public static double divide(int n1, int n2) {
		double result = n1 / n2;
		return result;

	}

}
