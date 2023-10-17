package mirae.com;

import java.util.Scanner;

public class a_18_odd_even {

	public static void main(String[] args) {
		 Scanner scan = new Scanner(System.in);
		 int count = 0; int win=0; int loss=0;
		 for(;;) { // 중지조건
			 int com= (int) (Math.random()*2);// 0,1
			 
			 System.out.println("0짝, 1홀을 입력하시요 ");
			 int person = Integer.parseInt(scan.nextLine());
			 if(person==9 )break;
			 count+=1;
			 if(person%2 == com )
			 {
				 win+=1; System.out.println("맞추었습니다. ");
			 }
			 else
			 {
				 loss+=1;System.out.println("틀렸습니다. ");
			 }System.out.println("총게임 횟수는= "+ count + "전:" + win + 
				 "승:" + loss + "패 입니다. ");
		 }
		 
		 
	}

}
