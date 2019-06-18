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
		/*
		 * String[] keyword1 = { "public", "private", "static", "class", "return",
		 * "package", "import", "null", "try", "catch" }; //파란색 String[] keyword2 = {
		 * "int", "String", "Connection", "Exception" };
		 * 
		 * for (String word : keyword1) { dto.setCode(dto.getCode().replace(word,
		 * "<span style='color:cornflowerblue'>" + word + "</span>")); }
		 * 
		 * for (String word : keyword2) { dto.setCode(dto.getCode().replace(word,
		 * "<span style='color:tomato'>" + word + "</span>")); }
		 */
		
		
		
		
		//구문 하일라이터 > 어떤 파일 지정?
		//dto.category
		//1. *.js
		//2. brush 
		String js = "";
		String brush = "";
		
		if (dto.getCategory().equals("1") || dto.getCategory().equals("3") || dto.getCategory().equals("7")) {
			js = "shBrushJava.js";
			brush = "java";
		} else if (dto.getCategory().equals("2")) {
			js = "shBrushSql.js";
			brush = "sql";
		} else if (dto.getCategory().equals("4") || dto.getCategory().equals("8")) {
			js = "shBrushXml.js";
			brush = "xml";
		} else if (dto.getCategory().equals("5")) {
			js = "shBrushCss.js";
			brush = "css";
		} else if (dto.getCategory().equals("6")) {
			js = "shBrushJScript.js";
			brush = "js";
		} 
		
		req.setAttribute("js", js);
		req.setAttribute("brush", brush);
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher 
			= req.getRequestDispatcher("/WEB-INF/views/code/view.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}












