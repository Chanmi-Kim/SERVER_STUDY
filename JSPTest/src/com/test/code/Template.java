package com.test.code;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Template extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//JSP 상단의 <%%> 역할
		
		//JSP 호출
		RequestDispatcher dispatcher 
			= req.getRequestDispatcher("/WEB-INF/views/code/template.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}












