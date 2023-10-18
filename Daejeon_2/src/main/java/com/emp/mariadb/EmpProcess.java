package com.emp.mariadb;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EmpProcess")
public class EmpProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmpProcess() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String str = request.getParameter("action");

		request.setCharacterEncoding("UTF-8");

		if (str.equals("insert")) { // 오타 수정
			int id = Integer.parseInt(request.getParameter("id"), 10);
			String name = request.getParameter("name");
			float salary = Float.parseFloat(request.getParameter("salary"));

			EmpDTO dto = new EmpDTO();
			dto.setId(id);
			dto.setName(name);
			dto.setSalary(salary);

			EmpDAO dao = new EmpDAO();
			boolean bool = dao.registerEmp(dto);

			PrintWriter out = response.getWriter();

			if (bool)
				response.sendRedirect("./Success.html");
			else
				out.println("입력에 실패하였습니다.");

		} else if (str.equals("select")) {
			EmpDAO dao = new EmpDAO();
			ArrayList<EmpDTO> vec = new ArrayList<EmpDTO>();
			vec = dao.getRecords(1, 20);

			if (vec != null) {
				request.setAttribute("datal", vec); // 속성 이름 수정

				ServletContext context = this.getServletContext();
				RequestDispatcher dispatcher = context.getRequestDispatcher("/43_showemp.jsp");

				dispatcher.forward(request, response);
			} else {
				// vec이 null인 경우에 대한 처리 로직 추가
			}
		}

		else if (str.equals("update")) {
			EmpDAO dao = new EmpDAO();
			int id = Integer.parseInt(request.getParameter("id"), 10);
			String name = request.getParameter("name");
			float salary = Float.parseFloat(request.getParameter("salary"));

			EmpDTO dto = new EmpDTO();
			dto.setId(id);
			dto.setName(name);
			dto.setSalary(salary);
			boolean bool = dao.updateEmp(dto);
			PrintWriter out = response.getWriter();
			if (bool) {
				response.sendRedirect("./Success.html");
			}
			else {
				out.println("수정에 실패하였습니다.");
				out.println("<a href = '43_EmpMenu.html'> 메뉴로 돌아가기</a>");
			}

		}
		else if (str.equals("delete")) { 
			EmpDAO dao = new EmpDAO();
		    String name = request.getParameter("name");
		     
		    EmpDTO dto = new EmpDTO();
		    dto.setName(name);

		    boolean bool = dao.deleteEmp(dto);
		    PrintWriter out = response.getWriter();
		    if (bool)
		        response.sendRedirect("./Success.html");
		    else
		        out.println("삭제에 실패하였습니다.");
		}
		else {
			response.sendRedirect("43_EmpMenu.html");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

}
