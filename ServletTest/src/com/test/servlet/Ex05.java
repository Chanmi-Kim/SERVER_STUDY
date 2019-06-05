package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex05 extends HttpServlet {

	//doGet() vs doPost() ???
	// - 브라우저 사용자가 이페이지를 어떤 상황에서 호출하는지 미리 상상
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();

		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='UTF-8'>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h1>데이터 입력하기</h1>");
		writer.println("<form method='GET' action='/ServletTest/ex05ok.do'>");
		writer.println("아이디 : <input type='text' name='txtid'>");
		writer.println("암호 : <input type='password' name='txtpw'>");
		writer.println("<input type='submit' value='보내기'>");
		writer.println("</form>");
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
		
	}
	
}
