package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex05data_4.do")
public class Ex05Data_4 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex05Data_4.java
		//1. 데이터 가져오기(num)
		//2. DB 작업 > DAO 위임(select)
		//3. 결과 반환 + JSP 호출
		
		String num = req.getParameter("num");
		
		String result = "";
		
		if (num.equals("1")) result = "하나";
		else if (num.equals("2")) result = "둘";
		else if (num.equals("3")) result = "셋";
		
		req.setAttribute("result", result);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex05data_4.jsp");
		dispatcher.forward(req, resp);
	}

}









