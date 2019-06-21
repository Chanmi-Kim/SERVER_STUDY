package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex11data_1.do")
public class Ex11Data_1 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex11Data_1.java
		String m = req.getParameter("m");
		
		if (m.equals("1")) {
			//고양이 추가하기
			
		} else if (m.equals("2")) {
			//고양이 이동하기
			
		} else if (m.equals("3")) {
			//고양이 삭제하기
			
		}
			

		
	}

}
