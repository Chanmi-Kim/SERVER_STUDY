package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex05data.do")
public class Ex05Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex05Data.java
		String data = "100";
		
		//일부 업무 - 시간 많이 걸림..
//		try {
//			
//			Thread.sleep(10000); //10초 소요
//			
//		} catch (Exception e) {
//			
//			System.out.println("Ex05Data.doGet : " + e.toString());
//		}
		
		req.setAttribute("data", data);		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex05data.jsp");
		dispatcher.forward(req, resp);
	}

}








