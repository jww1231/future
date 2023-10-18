package com.mirae;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/fortune") // @는 annotation이며 클래스를 설명 // tomcat서버는 servlet container
public class fortune extends HttpServlet { // HttpServlet 최상단 오브젝트
	private static final long serialVersionUID = 1L;

	
	
	public fortune() {
		super();
	}
	

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String[] list = { "즐거운 일주일의 시작이니 맘잘먹으면 좋은일 있을거에요", "행복하게 생각해서 행복한 날 ", "행복은 습관이다. 습관처럼 행복해지기" };
		int index = new Random().nextInt(3);
		String fortune = list[index];
		PrintWriter out = response.getWriter();
		// redirect 시켜서  jsp로 데이터를 전달
		out.println("<!doctype html>" + "<html>" + "<head>");
		out.println("<mata charset = 'utf-8' />");
		out.println("<title>오늘의 선택 페이지</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<p>" + fortune + "</p>");
		out.println("</body>");
		out.println("</html>");
	}

	// form에서 호출할때 get(전송하는 데이터가 노출) / post(전송하는 데이터를 숨겨서 전송함)
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String[] list = { "즐거운 일주일의 시작이니 맘잘먹으면 좋은일 있을거에요", "행복하게 생각해서 행복한 날 ", "행복은 습관이다. 습관처럼 행복해지기" };
		int index = new Random().nextInt(3);
		String fortune = list[index]; // ==> Restful 프로그래밍으로 발전 json으로 전달
		// json자바에서 사용하는 표준 데이터 포멧
		// 네트워크에서 데이터를 송수신 할때는 json을 사용
		// DBMS, NoSQL (Map( key(해시함수)data))은 기본적으로 데이터를 json으로 송수신
		// react 
		PrintWriter out = response.getWriter();
		// redirect 시켜서  jsp로 데이터를 전달
		out.println("<!doctype html>" + "<html>" + "<head>");
		out.println("<mata charset = 'utf-8' />");
		out.println("<title>오늘의 선택 페이지</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<p>" + fortune + "</p>");
		out.println("</body>");
		out.println("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String[] list = { "즐거운 일주일의 시작이니 맘잘먹으면 좋은일 있을거에요", "행복하게 생각해서 행복한 날 ", "행복은 습관이다. 습관처럼 행복해지기" };
		int index = new Random().nextInt(3);
		String fortune = list[index];
		PrintWriter out = response.getWriter();
		// redirect 시켜서  jsp로 데이터를 전달
		out.println("<!doctype html>" + "<html>" + "<head>");
		out.println("<mata charset = 'utf-8' />");
		out.println("<title>오늘의 선택 페이지</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<p>" + fortune + "</p>");
		out.println("</body>");
		out.println("</html>");
	}
}
