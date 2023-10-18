package com.sungjuk;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

// Dao Dto Servlet을 나누는 이유는 재사용을 위해서

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SungjukServlet") // /SungjukServlet SungjukServlet= new.SungjukServlet();의미가 있다 (같은 겉 아니다)
public class SungjukServlet extends HttpServlet { // 서블릿에 대한 인스턴스
	private static final long serialVersionUID = 1L;

	public SungjukServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {   
      //response.getWriter().append("Served at: ").append(request.getContextPath());
      request.setCharacterEncoding("UTF-8");
      String str= request.getParameter("action");   //insert,select,update,delete
      if (str.equals("insert"))   {
         String name = request.getParameter("name");
         int kor  = Integer.parseInt(request.getParameter("kor"));
         int mat = Integer.parseInt(request.getParameter("mat"));
         int eng = Integer.parseInt(request.getParameter("eng"));
         String schoolcode = request.getParameter("schoolcode");
         
         SungjukDto dto = new SungjukDto();
         dto.setName(name);
         dto.setKor(kor);
         dto.setMat(mat);
         dto.setEng(eng);
         dto.setSchoolcode(schoolcode);
         
         SungjukDao dao=new SungjukDao();
         int result =dao.registerMember(dto);
         PrintWriter out=response.getWriter();
         if (result ==0) response.sendRedirect("./success.html");
         else out.println("입력에 실패하였습니다.");
      }
      else if (str.equals("select")) {
    	  // 서블릿에서 하는 일 Dao호출
    	  SungjukDao dao = new SungjukDao();
    	  ArrayList<SungjukDto> vec = new ArrayList<SungjukDto>();
    	  vec = dao.selectMember();
    	  request.setAttribute("studentsungjuk", vec);
    	  // 전달방식 2가지
    	  // requestDispatcher , response.sendredirect()
    	  // Context 환경과 설정 정보
    	  ServletContext context = this.getServletContext();
    	  RequestDispatcher dispatcher = context.getRequestDispatcher("/showsungjuk.jsp");
    	  dispatcher.forward(request, response);
    	  
      }
      else if  (str .equals("update")) {
    	  // 번호, 이름 , 국, 영, 수
    	  SungjukDao dao= new SungjukDao();
    	  int bunho = Integer.parseInt( request.getParameter("bunho"));
    	  String name = request.getParameter("name");
    	  int kor = Integer.parseInt( request.getParameter("kor"));
    	  int mat = Integer.parseInt( request.getParameter("mat"));
    	  int eng = Integer.parseInt( request.getParameter("eng"));
    	  // String schoolcode = request.getParameter("schoolcode");
    	  
    	  SungjukDto dto = new SungjukDto();
    	  dto.setBunho(bunho);
    	  dto.setName(name);
    	  dto.setKor(kor);
    	  dto.setMat(mat);
    	  dto.setEng(eng);
    	  
    	  int result = dao.updateMember(dto);
    	  PrintWriter out = response.getWriter();
    	  if(result ==0) response.sendRedirect("./success.html");
    	  else out.println("수정이 실패하였습니다.");
      }
      else if (str.equals("delete")) {
    	  SungjukDao dao= new SungjukDao();
    	  String name = request.getParameter("name");
    	  SungjukDto dto = new SungjukDto();
    	  dto.setName(name);
    	  int result= dao.deleteMember(dto);
    	  PrintWriter out = response.getWriter();
    	  if(result == 0) response.sendRedirect("./success.html");
    	  else out.println("삭제에 실패했습니다. ");
    	  }
      else response.sendRedirect("sungjukmenu");
      
      
   }

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}