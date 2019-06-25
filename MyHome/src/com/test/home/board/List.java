package com.test.home.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//http://localhost:8088/myhome/board/list.do
@WebServlet("/board/list.do")
public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//List.java
		//1. DB 작업 > DAO 위임(select)
		//2. 결과 반환 + JSP 호출
		
		BoardDAO dao = new BoardDAO();
		
		ArrayList<BoardDTO> list = dao.list();
		
		for (BoardDTO dto : list) {
			
			//날짜 조작 - 일반적인 방법
			//String regdate = dto.getRegdate();
			//regdate = regdate.substring(0, 10);
			//dto.setRegdate(regdate);
			
			//날짜 조작 - 새로운 방법
			//1. 글쓴지 1시간 이내 : 30분 전
			//2. 글쓴지 1일 이내 : 2시 30분 전
			//3. 글쓴이 1일 넘어가면 : 3일 전
			int gap = dto.getGap();
			
			if (gap < 60) {
				dto.setRegdate(String.format("%d분 전", gap));
			} else if (gap < 60 * 24) {
				int hour = gap / 60;
				int min = gap % 60;
				dto.setRegdate(String.format("%d시간 %d분 전", hour, min));
			} else {
				int date = gap / 60 / 24;
				dto.setRegdate(String.format("%d일 전", date));
			}
			
			//제목이 길면 자르기
			String subject = dto.getSubject();
			
			if (subject.length() > 31) {
				subject = subject.substring(0, 30) + "..";
			}
			
			dto.setSubject(subject);
			
			
			//현재글이 최신글인지? (1시간 이내)
			// - Calendar - Calendar
			// - SQL 처리
			
		}//게시물 루프
		
		
		
		//View.java에서 F5에 의한 조회수 증가 방지 티켓 발급
		HttpSession session = req.getSession();
		session.setAttribute("isRead", "n");
		
		
		
		req.setAttribute("list", list);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/list.jsp");
		dispatcher.forward(req, resp);
	}

}










