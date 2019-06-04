package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//평범한 클래스 > 서블릿 역할 > 웹 페이지 제작 능력

//1. 서블릿 클래스 선언
//a. javax.servlet.http.HttpServlet 클래스를 상속한다.(간편함) ***
public class Ex01 extends HttpServlet {
	
	//2. doGet / doPost 메서드 선언
	//a. 매개 변수 작성(2개)
	//b. 예외 미루기
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		//3. 동적 HTML 문서 작성 구현
		response.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		
		writer.print("<html>");
		writer.print("<head>");
		writer.print("<meta charset='utf-8'>");
		writer.print("</head>");
		writer.print("<body>");
		writer.print("<h1>안녕하세요.</h1>");
		writer.print("<p>내용입니다.111</p>");
		
		Calendar c = Calendar.getInstance();
		writer.print("<p>" + c + "</p>");
		
		writer.print("</body>");
		writer.print("</html>");
		
		writer.close();
		
		//Ctrl + F11 실행
		//http://localhost:8088/ServletTest/servlet/com.test.servlet.Ex01
		//http://localhost:8088/ServletTest/ex01.do //가짜 주소 뜬 이유(이클립스)
		//404 File Not Found
		
	}

}


















