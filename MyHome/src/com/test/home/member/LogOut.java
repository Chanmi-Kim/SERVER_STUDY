package com.test.home.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/logout.do")
public class LogOut extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//LogOut.java
		//1. 인증 티켓 제거하기
		//2. 개인 정보 제거하기
		//3. JSP 호출
		
		//1.
		HttpSession session = req.getSession();
		
		session.removeAttribute("id");
		
		//2.
		session.removeAttribute("name");
		session.removeAttribute("nick");
		session.removeAttribute("lv");
		session.removeAttribute("point");
		session.removeAttribute("regdate");
		session.removeAttribute("pic");
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/logout.jsp");
		dispatcher.forward(req, resp);
	}

}







