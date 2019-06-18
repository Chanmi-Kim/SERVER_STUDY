package com.test.code;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Edit extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//edit.do?seq=10
		//1. 데이터 가져오기(seq)
		//2. DB 작업 > DAO 위임(select where)
		//3. 결과 반환 + JSP 호출
		
		//1.
		String seq = req.getParameter("seq");
		
		//2.
		CodeDAO dao = new CodeDAO();
		CodeDTO dto = dao.get(seq);
		
		ArrayList<CategoryDTO> clist = dao.clist(); //과목 목록 > 라디오 버튼들
		
		req.setAttribute("dto", dto);//수정할 내용
		req.setAttribute("clist", clist);
		
		RequestDispatcher dispatcher 
			= req.getRequestDispatcher("/WEB-INF/views/code/edit.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}












