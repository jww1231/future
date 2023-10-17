package mirae.com;

public class a_09_enum {
		// 일주일은 7일 : 경우의 수, 범주
	 
		public enum Day{
			Sun, Mon, Tue, Wed, Thu, Fri, Sat // 0,1,2,3,4,5,6 자동 매핑
			
		}
		public static void main(String[] args) {
			// enum타입
			// enum은 new를 사용하지 않음
			
			Day day = Day.Mon; // 범주데이터만 가능
			System.out.println("enum변수에 있는 값은 " + day);
			Day[] DayNow = Day.values(); // 전체값을 출력
			System.out.println(DayNow); // 주소값이 출력
			String str = ""; 
			// 파이썬에서는 사용하지 않음 for (int i = 0; i<10; i++) index에러 : 배열 접근시 인덱스 사용
			// abc[i]
			// 확장 for문은 순서적으로 객체를 리턴한다.
			// Collection
			
			for (Day Now : DayNow) { // extended for 문 (확장된 for문) 
				switch (Now) {
				case Sun : str = "Sunday"; break;
				case Mon : str = "Monday"; break;
				case Tue : str = "Tueday"; break;
				case Wed : str = "Wednesday"; break;
				case Thu : str = "Thursday"; break;
				case Fri : str = "Friday"; break;
				case Sat : str = "Saturday"; break;
				}
			}
			System.out.println(str);
			

	}
}

