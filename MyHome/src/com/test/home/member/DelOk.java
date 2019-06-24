package com.test.home.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/delok.do")
public class DelOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//DelOk.java
		//1. DB 작업 > DAO 위임(update where)
		//2. JSP 호출
		
		HttpSession session = req.getSession();
		
		MemberDAO dao = new MemberDAO();
		int result = dao.del(session.getAttribute("id").toString());
		
		if (result == 1) {
			//회원 탈퇴 > 로그아웃
			session.removeAttribute("id");
			session.removeAttribute("name");
			session.removeAttribute("nick");
			session.removeAttribute("lv");
			session.removeAttribute("point");
			session.removeAttribute("regdate");
			session.removeAttribute("pic");
		}
		
		req.setAttribute("result", result);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/delok.jsp");
		dispatcher.forward(req, resp);
	}

}



