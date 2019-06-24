package com.test.home.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/index.do")
public class Index extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Index.java
		
		//String id = "aaa";
		//req.setAttribute("id", id);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/index.jsp");
		dispatcher.forward(req, resp);
	}

}











