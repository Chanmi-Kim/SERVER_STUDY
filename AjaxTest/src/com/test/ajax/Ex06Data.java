package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex06data.do")
public class Ex06Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex06Data.java
		//1. 데이터 가져오기(id)
		//2. DB 작업 > DAO 위임(select where)
		//3. 결과 반환(1, 0) > Ajax에게 반환
		
		String id = req.getParameter("id");
		
		AjaxDAO dao = new AjaxDAO();
		
		int result = dao.idcheck(id);
		
		
		//http://localhost:8088/AjaxTest/ex06data.do?id=hong
		
		
		PrintWriter writer = resp.getWriter();
		
		writer.print(result);
		writer.close();
		
	}

}









