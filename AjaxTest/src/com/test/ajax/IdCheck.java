package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/idcheck.do")
public class IdCheck extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//IdCheck.java
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/idcheck.jsp");
		dispatcher.forward(req, resp);
	}//doGet
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. idcheck.do //window.open()
		//2. idcheck.do + submit //중복검사
		
		String id = req.getParameter("id");
		
		if (id != null) {
			//중복 검사 버튼 누름
			AjaxDAO dao = new AjaxDAO();
			int result = dao.idcheck(id);
			req.setAttribute("result", result);
			req.setAttribute("id", id);
		}		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/idcheck.jsp");
		dispatcher.forward(req, resp);
	}

}



























