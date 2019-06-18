package com.test.code;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//delok.do
public class DelOk extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기(seq)
		//2. DB 작업 위임 > DAO > delete
		//3. 결과 반환 + JSP 호출
		
		//1.
		String seq = req.getParameter("seq");//추가된 내용
		
		//2.
		CodeDAO dao = new CodeDAO();
		
		int result = dao.del(seq); //1 or 0
		
		req.setAttribute("result", result);	
		
		RequestDispatcher dispatcher 
			= req.getRequestDispatcher("/WEB-INF/views/code/delok.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}












