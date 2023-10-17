package mirae2.com;

public class b_02_stack {

	public static void main(String[] args) {
		System.out.println("프로그램 시작 첫 함수 호출 ");
		staticMethod1();
		staticMethod1();
		
		System.out.println("메인으로 복귀");
		System.out.println(fun(3));
		System.out.println(fun(2,4,1,2));
		System.out.println("종료합니다");
	}

	public static void staticMethod1() {
		int a = 10;
		System.out.println("첫 함수 진입");
		staticMethod2();
		System.out.println("두번째 함수 호출 종료");
	}

	public static void staticMethod2() {
		System.out.println("두번째 함수 진입");
		System.out.println("두번째 함수 종료");

	}
	//2x^2 + 4x +1 수학함수를 함수로 작성
	//ax^2 + bx +c => 2x^2 + 4x +1 , 2이면 얼마인가
	public static int fun(int x) {
		int ret = (int) (2* Math.pow(x, 2) + (4*x)+1);
		return ret;
		
	}
	
	public static int fun( int a, int b, int c, int x) {
		int ret = (int) (a* Math.pow(x, 2) + (b*x)+c);
		return ret;
		
	}
}
