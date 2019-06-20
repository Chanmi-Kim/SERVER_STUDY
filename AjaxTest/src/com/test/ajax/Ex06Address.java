package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex06address.do")
public class Ex06Address extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex06Address.java
		//1. 데이터 가져오기(search)
		//2. DB 작업 > DAO 위임(select where)
		//3. 결과 반환 + JSP 호출
		
		//1.
		String search = req.getParameter("search");
		
		//2.
		AjaxDAO dao = new AjaxDAO();
		
		ArrayList<ZipCodeDTO> list =  dao.search(search);
		
		req.setAttribute("list", list);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex06address.jsp");
		dispatcher.forward(req, resp);
	}

}



















