package com.test.ajax;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex03data.do")
public class Ex03Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex03Data.java
		
		//총 참여 인원 수
		int cnt = 35;
		
		Random rnd = null;
		System.out.println(rnd.nextInt());
		
		req.setAttribute("cnt", cnt);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex03data.jsp");
		dispatcher.forward(req, resp);
	}

}






