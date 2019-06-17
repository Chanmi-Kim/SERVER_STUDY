package com.test.code;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Add extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. DB 작업 > CodeDAO 위임
		//2. 결과값 반환 + JSP 호출
		
		CodeDAO dao = new CodeDAO();
		
		ArrayList<CategoryDTO> clist = dao.clist();
		
		
		//서블릿 -> JSP
		req.setAttribute("clist", clist);
		
		RequestDispatcher dispatcher 
			= req.getRequestDispatcher("/WEB-INF/views/code/add.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}












