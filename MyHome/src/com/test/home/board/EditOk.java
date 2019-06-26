package com.test.home.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.home.AuthCheck;

@WebServlet("/board/editok.do")
public class EditOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//인증 사용자?
		AuthCheck auth = new AuthCheck(req.getSession(), resp);
		auth.allow();
		

		//EditOk.java
		// == AddOk.java
		//1. 데이터 가져오기
		//2. DB 작업 > DAO 위임(update)
		//3. 결과 반환 + JSP 호출
		
		//1.
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();

		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		String tag = req.getParameter("tag");
		String seq = req.getParameter("seq");
		
		//2.
		BoardDTO dto = new BoardDTO();
		
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setTag(tag);
		dto.setSeq(seq);
		
		BoardDAO dao = new BoardDAO();
		
		int result = dao.edit(dto);
		
		req.setAttribute("result", result);
		req.setAttribute("seq", seq);


		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/editok.jsp");
		dispatcher.forward(req, resp);
	}

}








