package com.test.home.etc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/etc/book.do")
public class Book extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Book.java
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/etc/book.jsp");
		dispatcher.forward(req, resp);
	}

}
