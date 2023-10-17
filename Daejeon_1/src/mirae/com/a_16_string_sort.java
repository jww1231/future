package mirae.com;

public class a_16_string_sort {

	public static void main(String[] args) {
		String str11 = "Hello";
		String str21 = "Hello";
		String str31 = "World";
		System.out.println("str1.compareTo(str2) ? "
				+str11.compareTo(str21)); // 0
		System.out.println("str1.compareTo(str3) ? "
				+str11.compareTo(str31)); // 뒤에것이 크면 -
		System.out.println("str3.compareTo(str1) ? "
				+str31.compareTo(str11)); // 앞에것이 크면 +
	 
		
		// 통찰력 없는 컴을 위해서 일일히 비교할 수 있도록 프로그래밍 하시오 (bubble sort)
		String[] strarray = {"대한", "민국", "만세", "한국", "대전"};
		
		for (int i = 0; i < strarray.length ; i++) {
			boolean changed = false;
			for (int j = 0; j < strarray.length - i - 1; j++) {
				if (strarray[j].compareTo(strarray[j + 1]) > 0) {
					String temp = strarray[j];
					strarray[j] = strarray[j + 1];
					strarray[j + 1] = temp;
					changed = true;
				}
			}
			if(!changed) break; // 변경하지 않았으면 종료
			
			
		}
		for (int i = 0; i < strarray.length; i++)
		
		System.out.print(strarray[i] + " ");
	}

}
