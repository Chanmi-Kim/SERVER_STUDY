package com.test.home.board;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.home.AuthCheck;

@WebServlet("/board/delok.do")
public class DelOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//인증 사용자?
		AuthCheck auth = new AuthCheck(req.getSession(), resp);
		auth.allow();

		//DelOk.java
		//1. 데이터 가져오기
		//2. DB 작업 > DAO 위임(delete)
		//3. 결과 반환 + JSP 호출
		
		String seq = req.getParameter("seq");
		
		BoardDAO dao = new BoardDAO();
		
		//부모글 삭제
		//1. 댓글X
		//   - 문제 X
		//2. 댓글O
		//   a. 못 지운다.
		//   b. 강제로 지운다.(댓글 포함)
		//댓글 삭제
		dao.delAllComment(seq);//1, 0(fail) > null(0) : 상태 구분
		
		//파일 삭제
		File file = new File(req.getRealPath("/files") + "\\" + dao.get(seq).getFilename());
		if (file.exists()) {
			file.delete();
		}
		
		
		//해시 태그 삭제
		dao.delHash(seq);
		
		
		//글 삭제
		int result = dao.del(seq);
		
		req.setAttribute("result", result);		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/delok.jsp");
		dispatcher.forward(req, resp);
	}

}








