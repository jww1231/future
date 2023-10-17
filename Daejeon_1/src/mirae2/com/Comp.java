package mirae2.com;

// 팀 : 가위바위보 게임( 객체 3개 :  comp (랜덤) , player(입력) , judge(판단))
// 게임 승패 결정
public class Comp {
	public int com;

	public Comp() {
	}

	public Comp(int com) {
		this.com = com;
	}

	public void calCom() {
		com = (int) (Math.random() * 100) % 3;
	}

}
