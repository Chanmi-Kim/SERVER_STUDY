package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex05data_3.do")
public class Ex05Data_3 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex05Data_3.java
		//1. 데이터 가져오기(data=홍길동)
		//2. 업무 처리
		//3. 종료
		
		String data = req.getParameter("data");
		
		System.out.println("data : " + data);
		
	}

}








