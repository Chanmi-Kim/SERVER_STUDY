package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex08data.do")
public class Ex08Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex08Data.java
		//1. 데이터 가져오기
		//2. DB작업 > DAO 위임(insert)
		//3. 결과 통보 + XML
		
		String id = req.getParameter("id");
		String x = req.getParameter("x");
		String y = req.getParameter("y");
		
		System.out.println(x + ", " + y);
		
		AjaxDAO dao = new AjaxDAO();
		
		CatDTO dto = new CatDTO();
		
		dto.setCatid(id);
		dto.setX(x);
		dto.setY(y);
		
		int result = dao.setPosition(dto);
		
	}

}










