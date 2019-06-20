package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex08.do")
public class Ex08 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex08.java
		//1. DB 작업 > DAO 위임(select where)
		//2. 결과 반환 + JSP 호출
		
		AjaxDAO dao = new AjaxDAO();
		ArrayList<CatDTO> list = dao.listCat();
		
		//req.setAttribute("dto", list.get(0));
		req.setAttribute("list", list);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex08.jsp");
		dispatcher.forward(req, resp);
	}

}







