package mirae2.com;
// 게임결정
// 게임 승패결과 저장
// 게임 결과를 출력

public class RSP_Judge {
	int totalcount;
	int wincount;
	int losecount;
	int drawcount;
	public RSP_Judge() {
		totalcount=0; wincount=0; losecount=0; drawcount=0;
		System.out.println("게임이 초기화 되었습니다 ");
	}
    public static int doif(int com, int person) {
        if (person == 0) {
            if (com == 0)
                return 2;
            else if (com == 1)
                return 0;
            else
                return 1;
        } else if (person == 1) {
            if (com == 0)
                return 0;
            else if (com == 1)
                return 2;
            else
                return 1;
        } else {
            if (com == 0)
                return 1;
            else if (com == 1)
                return 0;
            else
                return 2;
        }
    }

    public static int doarray(int com, int person) {
        int[][] judge = {{0, 1, 2}, {2, 0, 1}, {1, 2, 0}};
        return judge[com][person];
    }

    public static int docalc(int com, int person) {
        if (com == (person % 3)) {
            return 0;
        } else if ((com + 1) % 3 == (person % 3)) {
            return 1;
        } else {
            return 2;
        }
    }
	
	public void gamedicision (int com, int user) {
		int result = doif (com, user);
		totalcount+=1;
		if( result == 0) {
			System.out.println("이김");
			wincount+=1;
		} else if( result == 1) {
			System.out.println("짐");
			losecount+=1;
		} else {
			System.out.println("비김");
			drawcount+=1;
		}
	}
	public void print() {
		System.out.println("게임결과 :" + totalcount + "전" 
	+ wincount+ "승" + losecount + "패"+ drawcount + "비김");
	}
}
