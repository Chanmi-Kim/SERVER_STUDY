package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex03.do") //현재 프로젝트내에서 유일한 URL
public class Ex03 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//ex03.do - 처음 요청
		//ex03.do?data=1 - 버튼 요청

		//Ex03.java
		
		//1. DB
		//2. 총 인원 수
		//3. JSP 전달
		if (req.getParameter("data") != null) {
			//
			int cnt = 25; //select count(*)
			req.setAttribute("cnt", cnt);
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex03.jsp");
		dispatcher.forward(req, resp);
	}

}









