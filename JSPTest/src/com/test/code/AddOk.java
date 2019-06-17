package com.test.code;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//addok.do
public class AddOk extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기
		//2. DTO 담고 DB 작업 위임 > DAO > insert
		//3. 결과 반환 + JSP 호출
		
		//1.
		req.setCharacterEncoding("UTF-8");
		
		String category = req.getParameter("category");
		String subject = req.getParameter("subject");
		String code = req.getParameter("code");
		String description = req.getParameter("description");
		
		//2.
		CodeDAO dao = new CodeDAO();
		
		CodeDTO dto = new CodeDTO();
		
		dto.setCategory(category);
		dto.setSubject(subject);
		dto.setCode(code);
		dto.setDescription(description);
		
		int result = dao.add(dto); //1 or 0
		
		req.setAttribute("result", result);		
		
		RequestDispatcher dispatcher 
			= req.getRequestDispatcher("/WEB-INF/views/code/addok.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}












