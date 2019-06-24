package com.test.home.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/loginok.do")
public class LoginOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//LoginOk.java
		//1. 데이터 가져오기
		//2. DB 작업 > DAO 위임(select where)
		//3. 결과 반환
		//		3.1 인증 성공 > 인증 티켓 발급
		//		3.2 인증 실패 > X
		//4. JSP 호출
		
		//서블릿에서 session 객체 얻어오기
		HttpSession session = req.getSession();
		
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPw(pw);
		
		MemberDAO dao = new MemberDAO();
		MemberDTO result = dao.login(dto); //not null | null
		
		if (result != null) {
			//로그인 성공 > 인증 티켓 발급
			session.setAttribute("id", result.getId());//인증 티켓("auth")
			session.setAttribute("name", result.getName());
			session.setAttribute("nick", result.getNick());
			session.setAttribute("lv", result.getLv());
			session.setAttribute("point", result.getPoint());
			session.setAttribute("regdate", result.getRegdate());
			session.setAttribute("pic", result.getPic());
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/loginok.jsp");
		dispatcher.forward(req, resp);
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

}












