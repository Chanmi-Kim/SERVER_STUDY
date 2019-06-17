package com.test.code;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class View extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기(seq)
		//2. DB 작업 > DAO 위임(select where)
		//3. 결과 반환 > JSP 호출
		
		//1.
		String seq = req.getParameter("seq");
		
		//2.
		CodeDAO dao = new CodeDAO();
		
		CodeDTO dto = dao.get(seq);
		
		//JSP에게 전달 데이터 일부 가공
		//desc = desc.replace()
		//일반 텍스트 개행 문자 - replace로 처리
		dto.setDescription(dto.getDescription().replace("\r\n", "<br>"));	
		
		//프로그램 코드 - 탭문자, 개행문자, 공백문자 연속 - replace 불편 -> <pre>
		//dto.setCode(dto.getCode().replace("\r\n", "<br>"));
		//dto.setCode(dto.getCode().replace("\t", "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"));
		
		//현재 언어 : 자바 -> 몇몇 키워드
		String[] keyword1 = { "public", "private", "static", "class", "return", "package", "import", "null", "try", "catch" }; //파란색
		String[] keyword2 = { "int", "String", "Connection", "Exception" };
		
		for (String word : keyword1) {
			dto.setCode(dto.getCode().replace(word, "<span style='color:cornflowerblue'>" + word + "</span>"));
		}
		
		for (String word : keyword2) {
			dto.setCode(dto.getCode().replace(word, "<span style='color:tomato'>" + word + "</span>"));
		}
		
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher 
			= req.getRequestDispatcher("/WEB-INF/views/code/view.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}












