package com.sungjuk;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// 미리 지정된 아이디와 패스워드
	// DB하고 연결해서 처리하시오
	// 문제 sungjuk데이터 베이스 - login을 위해서 userId, password 테이블을 생성
	// DB를 연결하고 클라이언트에서 요청하는 ID에 대하여 패스워드를 가지고옴
	
	private final String userID = "admin"; // 클라이언트에서 요청
	private final String password = "password"; // DB에서 온 패스워드
    // 
	
	
	
    public LoginServlet() {       super();    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		String user = request.getParameter("user");
		String pwd = request.getParameter("pwd"); // 성공
		if(userID.equals(user)&& password.equals(pwd)) { // 세션 : 새로운 유저마다 생성
			HttpSession session = request.getSession();
			session.setAttribute("user", "korea"); // 로그아웃하고 사이트 나갈때 까지 유지됨
			session.setMaxInactiveInterval(30*60); // 30분만 유지된다는 뜻
			
			Cookie userName = new Cookie("user", user); // 웹브라우저에 저장
			userName.setMaxAge(30*60); // 30분동안 저장됨
			response.addCookie(userName);// 보내기만 하면 웹브라우저에 자동 저장됨
			response.sendRedirect("LoginSuccess.jsp");
		}else { // 로그인 실패시
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.html"); // 체이닝 chainning
			PrintWriter out = response.getWriter(); // 출력객체를 얻은 다음
			//두개의 결과를 결합해서 출력
			out.println("<font color=red> id와 password가 잘못되었습니다.</font>"); 
			rd.include(request, response); // forward
			
			
		}
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		doGet(request, response);
	}

}
