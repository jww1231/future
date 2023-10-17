package mirae4.com;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Random;
import java.util.Set;

// 문제 [5][5] 행렬을 만들고 순서대로 행우선으로 숫자를 입력하시요
public class e_07_bingo {
	public static void main(String[] args) {
		Set set = new HashSet(); // 키이로 구성된 자료구조( 중복을 불허 )
		// 어떤 데이터가 입력될까
        int[][] board = new int[5][5];
        Random generator = new Random(System.currentTimeMillis());
        for(int i=0; set.size() < 25; i++) { // 25개의 경우의 수  
        	  //0~ 24 => 1~ 25
              set.add(Math.abs(generator.nextInt()%25) + 1 + "");// 문자열
        }// 0~ 24
        // 이 데이터를 board에 채워보시요
        Iterator it = set.iterator();
        for(int i=0; i < board.length; i++) {
              for(int j=0; j < board[i].length; j++) {
                    board[i][j] = Integer.parseInt((String)it.next());
                    System.out.print((board[i][j] < 10 ? "  " : " ") + board[i][j]);
              }
              System.out.println();
        }
        ArrayList<Integer> list = new ArrayList<Integer>(25);
        for(int i= 0; i <25; i++){
       	 list.add(i);
        }
        Collections.shuffle(list); // 뒤섞다
        Iterator itr = list.iterator();
        while(itr.hasNext()){
       	 System.out.print(itr.next() + " ");
        } // 왜 에러가 발생하는지 ?\
        itr = list.iterator();
		for (int i = 0; i < board.length; i++) {
			for (int j = 0; j < board[i].length; j++) {
				board[i][j] = (int) itr.next();
				System.out.print((board[i][j] < 10 ? "  " : " ") + board[i][j]);
			}
			System.out.println();
		}        
	}
}