package mirae2.com;

public class RSP_gametest {

	public static void main(String[] args) {
		RSP_Comp comp = new RSP_Comp();
		RSP_User user = new RSP_User();
		RSP_Judge judge = new RSP_Judge();
		
		while(true) {
			int player = user.getUser();
			int com = comp.getComputer();
			if(player == -1) {
				System.out.println(" 게임이 종료되었습니다.");
				judge.print();
				break;
			}
			judge.gamedicision(com, player);
		}
		

	}

}
