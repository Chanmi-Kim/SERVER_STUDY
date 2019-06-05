package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex05Ok extends HttpServlet {

	//doGet() vs doPost()
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기(폼 태그가 전송한 데이터(폼 파라미터)를 수신하는)
		// - HttpServletRequest 담당
		// - req.getParameter("넘긴 데이터 식별자")
		// - 식별자 : 폼태그의 name값을 사용
		
		String id = req.getParameter("txtid"); //<input type="text" name="txtid"
		String pw = req.getParameter("txtpw"); //<input type="password" name="txtpw"
		
		//디버깅 - 웹서버측 콘솔 출력
		// - 브라우저 측과 아무 관계없음. > 일반 유저는 이 메시지를 절대로 볼 수 없음.
		System.out.println(id);
		System.out.println(pw);
		
		//로그인 처리 - 가정
		// + Oracle
		boolean result = false;
		
		if (id.equals("hong") && pw.equals("1234")) {
			//로그인 성공 메시지
			result = true;
		} else {
			//로그인 실패 메시지
			result = false;
		}
		
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.println("<html>");
		writer.println("<head><meta charset='utf-8'></head>");
		writer.println("<body>");
		writer.println("<h1>로그인 결과</h1>");
		
		if (result) {
			writer.println("로그인을 성공했습니다.");
		} else {
			writer.println("로그인을 실패했습니다.");
		}
			
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
		
	}
	
}
