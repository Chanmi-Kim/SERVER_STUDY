package com.test.home.mobile;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/m/ex.do")
public class Ex extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex.java
		//ex.do?no=01  : ?키=값&키=값 (Query String)
		//ex.do?01
		String no = req.getQueryString();
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mobile/ex" + no + ".jsp");
		dispatcher.forward(req, resp);
	}

}






