package mirae2.com;
// 가위바위보 선택 변수
// getComputer();

public class RSP_Comp {
	private int answer;
	public RSP_Comp() {} // default 생성자
	public RSP_Comp(int answer){
		this.answer = answer;
	}
	public int getComputer() {
		answer = (int) ((Math.random()* 100)%3);
		return answer;
 	}

}
