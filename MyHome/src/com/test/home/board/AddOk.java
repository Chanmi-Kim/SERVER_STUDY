package com.test.home.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/addok.do")
public class AddOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//AddOk.java
		//1. 데이터 가져오기
		//2. DB 작업 > DAO 위임(insert)
		//3. 결과 반환 + JSP 호출
		
		//1.
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();

		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		String tag = req.getParameter("tag");
		String id = session.getAttribute("id").toString();
		String userip = req.getRemoteAddr();
		
		//관리자 : 0 or 1
		//일반 : null > 0
		String notice = req.getParameter("notice");
		
		if (notice == null) notice = "0";
		
		
		
		
		//2.
		BoardDTO dto = new BoardDTO();
		
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setTag(tag);
		dto.setId(id);
		dto.setUserip(userip);
		dto.setNotice(notice);
		
		BoardDAO dao = new BoardDAO();
		
		int result = dao.add(dto);
		
		req.setAttribute("result", result);		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/addok.jsp");
		dispatcher.forward(req, resp);
	}

}








