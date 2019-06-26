package com.test.home.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/addcomment.do")
public class AddComment extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//AddComment.java
		// - /board/addcomment.do
		
		//1. 데이터 가져오기
		//2. DB 작업 > DAO 위임(insert)
		//3. 결과 반환 + JSP 호출하기
		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
		String content = req.getParameter("content");
		String pseq = req.getParameter("pseq");
		
		CommentDTO cdto = new CommentDTO();
		
		cdto.setContent(content);
		cdto.setPseq(pseq);
		cdto.setId(session.getAttribute("id").toString());
		
		BoardDAO dao = new BoardDAO();
		
		int result = dao.addComment(cdto);
		
		req.setAttribute("result", result);
		req.setAttribute("pseq", pseq);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/addcomment.jsp");
		dispatcher.forward(req, resp);
	}

}









