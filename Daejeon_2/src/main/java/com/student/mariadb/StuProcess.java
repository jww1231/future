package com.student.mariadb;

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

import com.emp.mariadb.EmpDAO;
import com.emp.mariadb.EmpDTO;

@WebServlet("/StuProcess")
public class StuProcess extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public StuProcess() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String str = request.getParameter("action");

        request.setCharacterEncoding("UTF-8");
        if (str != null && str.equals("insert")) {
            String name = request.getParameter("name");
            int kor = Integer.parseInt(request.getParameter("kor"));
            int eng = Integer.parseInt(request.getParameter("eng"));
            int mat = Integer.parseInt(request.getParameter("mat"));

            StuDTO dto = new StuDTO();
            dto.setName(name);
            dto.setKor(kor); // Fix the set method (setEng -> setKor)
            dto.setEng(eng);
            dto.setMat(mat);

            StuDAO dao = new StuDAO();
            boolean bool = dao.registerStu(dto);

            PrintWriter out = response.getWriter();

            if (bool)
                response.sendRedirect("./Success2.html");
            else
                out.println("입력에 실패하였습니다.");

        } else if (str != null && str.equals("select")) {
            StuDAO dao = new StuDAO();
            ArrayList<StuDTO> vec = new ArrayList<StuDTO>();
            vec = dao.getRecords(1, 5);

            if (vec != null) {
                request.setAttribute("datal", vec);

                ServletContext context = this.getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/showstu.jsp");

                dispatcher.forward(request, response);
            } else {
                // vec이 null인 경우에 대한 처리 로직 추가
                PrintWriter out = response.getWriter();
                out.println("<p>데이터 조회에 실패하였습니다.</p>");
                out.println("<a href='StuMenu.html'>메뉴로 돌아가기</a>");
                return;
            }
        } else if (str != null && str.equals("update")) {
            StuDAO dao = new StuDAO();
            String name = request.getParameter("name");
            int kor = Integer.parseInt(request.getParameter("kor"));
            int eng = Integer.parseInt(request.getParameter("eng"));
            int mat = Integer.parseInt(request.getParameter("mat"));

            StuDTO sto = new StuDTO();
            sto.setName(name);
            sto.setKor(kor);
            sto.setEng(eng);
            sto.setMat(mat); // Fix the set method (setEng -> setMat)
            PrintWriter out = response.getWriter();
            boolean bool = dao.updateStu(sto);

            if (bool) {
                response.sendRedirect("./Success2.html");
            } else {
                out.println("수정에 실패하였습니다.");
                out.println("<a href='StuMenu.html'>메뉴로 돌아가기</a>");
            }
        } else if (str != null && str.equals("delete")) {
            StuDAO dao = new StuDAO();
            String name = request.getParameter("name");

            StuDTO dto = new StuDTO();
            dto.setName(name);

            boolean bool = dao.deleteStu(dto);
            PrintWriter out = response.getWriter();
            if (bool)
                response.sendRedirect("./Success2.html");
            else
                out.println("삭제에 실패하였습니다.");
        } else {
            response.sendRedirect("StuMenu.html");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
