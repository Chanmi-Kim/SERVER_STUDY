package com.test.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Hello extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//서블릿 업무
		// - HTML 문서 생성과는 아무 상관없는 업무
		
		//JSP 페이지 호출
		//1. <a> : X
		//2. location.href : X
		//3. response.sendRedirect() : 새요청 : X
		//4. pageContext.forward() : 데이터 전달 : X
		//5. <jsp:forward> : X
		
		//sendRedirect에서 절대 경로 "/" -> "http://localhost:8090"
		//resp.sendRedirect("/JSPTest/mvc/hello.jsp");
		
		
		//DB 가져온 주소록 항목 갯수 
		req.setAttribute("cnt", 12);
		
		
		//getRequestDispatcher에서 절대 경로 "/" -> "WebContent"
		RequestDispatcher dispatcher 
			= req.getRequestDispatcher("/mvc/hello.jsp");
		
		//A 알바생 사용하던 request,responst -> B 알바생 전달 + 호출
		dispatcher.forward(req, resp);
		
		//http://localhost:8088/JSPTest/mvc/hello.jsp
		//http://localhost:8088/JSPTest/mvc/hello.do : ****
	}
	
}



























