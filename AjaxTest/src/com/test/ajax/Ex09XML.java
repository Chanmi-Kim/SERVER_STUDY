package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex09xml.do")
public class Ex09XML extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//ex09xml.do?type=xml&data=호랑이
		
		//Ex09XML.java
		//1.
		String type = req.getParameter("type");
		String data = req.getParameter("data");
		
		//2.
		AnimalDTO dto = new AnimalDTO();
		dto.setType(type);
		dto.setData(data);
		
		AjaxDAO dao = new AjaxDAO();
		
		dao.add(dto);
		
		ArrayList<AnimalDTO> list = dao.data(dto);
		
		req.setAttribute("list", list);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex09xml.jsp");
		dispatcher.forward(req, resp);
	}

}

