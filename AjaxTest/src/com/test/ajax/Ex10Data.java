package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex10data.do")
public class Ex10Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//ex10data.do?m=1
		//ex10data.do?m=2
		//ex10data.do?m=3
		
		//Ex10Data.java
		String m = req.getParameter("m");
		
		req.setAttribute("m", m);

		AjaxDAO dao = new AjaxDAO();
		
		if (m.equals("1")) {
			
			ResearchDTO dto = dao.get("1");
			String question = dto.getQuestion();
			
			req.setAttribute("question", question);
			
		} else if (m.equals("2")) {
			
			//가장 마지막 입력했던 동물 데이터 반환
			AnimalDTO dto = dao.getAnimal();
			req.setAttribute("dto", dto);
			
		} else if (m.equals("3")) {
			
			//다중 레코드 반환
			ArrayList<AnimalDTO> list = dao.data();
			req.setAttribute("list", list);			
		}
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex10data.jsp");
		dispatcher.forward(req, resp);
	}

}









