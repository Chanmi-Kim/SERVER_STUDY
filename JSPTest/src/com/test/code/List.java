package com.test.code;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class List extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. DB 작업 > DAO 위임(select)
		//2. 결과 반환 + JSP 호출
		
		//1.
		CodeDAO dao = new CodeDAO();
		
		ArrayList<CodeDTO> list = dao.list();
		
		//2.
		req.setAttribute("list", list);		
		
		RequestDispatcher dispatcher 
			= req.getRequestDispatcher("/WEB-INF/views/code/list.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}












