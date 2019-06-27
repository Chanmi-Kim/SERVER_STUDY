package com.test.home.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/delcomment.do")
public class DelComment extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//DelComment.java
		//1. 데이터 가져오기
		//2. DB 작업 > DAO 위임(delete)
		//3. 결과 반환 + JSP 호출

		String seq = req.getParameter("seq"); //삭제할 댓글 번호
		String pseq = req.getParameter("pseq"); //돌아갈 부모글 번호
		
		BoardDAO dao = new BoardDAO();
		
		int result = dao.delComment(seq);
		
		req.setAttribute("result", result);
		req.setAttribute("pseq", pseq);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/delcomment.jsp");
		dispatcher.forward(req, resp);
	}

}













