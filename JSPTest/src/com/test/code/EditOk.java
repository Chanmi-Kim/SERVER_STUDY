package com.test.code;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//addok.do
public class EditOk extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기
		//2. DTO 담고 DB 작업 위임 > DAO > update
		//3. 결과 반환 + JSP 호출
		
		//1.
		req.setCharacterEncoding("UTF-8");
		
		String category = req.getParameter("category");
		String subject = req.getParameter("subject");
		String code = req.getParameter("code");
		String description = req.getParameter("description");
		String seq = req.getParameter("seq");//추가된 내용
		
		//2.
		CodeDAO dao = new CodeDAO();
		
		CodeDTO dto = new CodeDTO();
		
		dto.setCategory(category);
		dto.setSubject(subject);
		dto.setCode(code);
		dto.setDescription(description);
		dto.setSeq(seq);//새로 추가
		
		int result = dao.edit(dto); //1 or 0
		
		req.setAttribute("result", result);	
		req.setAttribute("seq", seq);
		
		RequestDispatcher dispatcher 
			= req.getRequestDispatcher("/WEB-INF/views/code/editok.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}












