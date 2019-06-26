package com.test.home.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

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
	
	/*
	 * @Override protected void doPost(HttpServletRequest req, HttpServletResponse
	 * resp) throws ServletException, IOException { doGet(req, resp); }
	 */

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//list.do 용도
		//1. 목록 보기
		// - list.do
		//2. 검색 결과 보기
		// - list.do?column=subject&word=검색어
		//3. 검색X + view.do에서 돌아가기
		// - list.do?column=&word=
		
		
		req.setCharacterEncoding("UTF-8");
		
		String column = req.getParameter("column");
		String word = req.getParameter("word");
		boolean isSearch = false;
		
		HashMap<String,String> map = new HashMap<String,String>();
		
		if ((column != null && word != null) && (column != "" && word != "")) {
			//검색하려고 요청했음
			isSearch = true;
			map.put("column", column);
			map.put("word", word);
		}
		
		map.put("isSearch", isSearch + "");
		
		
		
		
		//검색어 수집
		BoardDAO dao = new BoardDAO();
		HttpSession session = req.getSession();

		if (isSearch) {
			
			SearchDTO sdto = new SearchDTO();
			
			sdto.setColumnName(column);
			sdto.setWord(word);
			sdto.setId(session.getAttribute("id") != null ? session.getAttribute("id").toString() : "");
			
			dao.addSearch(sdto);
			
		}
		
		
		
		
		
		

		//List.java
		//1. DB 작업 > DAO 위임(select)
		//2. 결과 반환 + JSP 호출
		ArrayList<BoardDTO> list = dao.list(map);
		
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
			
			
			
			//제목에서 검색중이면 검색어를 강조
			if (isSearch && column.equals("subject")) {
				//안녕하세요. 게시판 수업중입니다.
				//안녕하세요. <span style='background-color:gold;color:tomato;'>게시판</span> 수업중입니다.
				subject = subject.replace(word, "<span style='background-color:gold;color:tomato;'>" + word + "</span>");
				dto.setSubject(subject);
			}
			
//			if (column.equals("subject") && isSearch) {
//				
//			}
			
//			if (isSearch) {
//				if (column.equals("subject")) {
//					
//				}
//			}
			
			
		}//게시물 루프
		
		
		
		//View.java에서 F5에 의한 조회수 증가 방지 티켓 발급
		session.setAttribute("isRead", "n");
		
		
		
		req.setAttribute("isSearch", isSearch);
		req.setAttribute("column", column);
		req.setAttribute("word", word);
		//req.setAttribute("map", map);
		
		req.setAttribute("list", list);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/list.jsp");
		dispatcher.forward(req, resp);
	}

}










