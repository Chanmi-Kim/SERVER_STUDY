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
		
		
		
		
		
		
		
		//페이징 + 페이지바 관련 변수
		int nowPage = 0;			//현재 페이지 번호
		int totalCount = 0;		//총 게시물 
		int pageSize = 10;		//한 페이지당 출력 게시물 수
		int totalPage = 0;		//총 페이지
		int begin = 0;				//where 절
		int end = 0;					//where 절
		int n = 0;						//페이지 바 제작
		int loop = 0;					//페이지 바 제작
		int blockSize = 10;		//페이지 바 제작
		
		
		
		//list.do > list.do?page=1
		//list.do?page=3
		
		String page = req.getParameter("page");
		
		if (page == null || page == "") nowPage = 1;
		else nowPage = Integer.parseInt(page);
		
		//nowPage : 현재 보게될 페이지 번호 + 연산
		//1page -> where rnum between 1 and 10
		//2page -> where rnum between 11 and 20
		//3page -> where rnum between 21 and 30
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;
		
		map.put("begin", begin + "");
		map.put("end", end + "");
		
		
		//총 게시물 수 알아내기
		totalCount = dao.getTotalCount(map);
		
		//총 페이지 수 알아내기
		//256 / 10 = 25.6 > 26
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
	
		

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
		
		
		
		
		
		
		//페이지 바 제작
		String pagebar = ""; //JSP 돌려줄 페이지 바 태그
		
		
		
//		for (int i=1; i<=totalPage; i++) {
//			
//			if (i == nowPage) {
//				pagebar += String.format(" <a href='#' onclick='event.preventDefault();' style='color:tomato;'>%d</a> ", i);
//			} else {
//				pagebar += String.format(" <a href='/myhome/board/list.do?page=%d'>%d</a> ", i, i);
//			}
//			
//		}
		
		//list.do?page=1
		//1 2 3 4 5 6 7 8 9 10
		
		//list.do?page=5
		//1 2 3 4 5 6 7 8 9 10
		
		//list.do?page=10
		//1 2 3 4 5 6 7 8 9 10
		
		//list.do?page=12
		//11 12 13 14 15 16 17 18 19 20
		
		
		//list.do?page=10
		//6 7 8 9 10 11 12 13 14 15
		
		loop = 1; //루프 변수(while)
		n = ((nowPage - 1) / blockSize) * blockSize + 1;//페이지 번호
		
	
		
		
		pagebar += "<nav>\r\n" + 
				"  <ul class='pagination'>";
		
		
		//이전 10페이지
//		if (n == 1) {
//			pagebar += String.format(" <a href='#' onclick='event.preventDefault();'>[이전 %d페이지]</a> ", blockSize);
//		} else {
//			pagebar += String.format(" <a href='/myhome/board/list.do?page=%d'>[이전 %d페이지]</a> ", n-1, blockSize);
//		}
		
		if (n == 1) {
			pagebar += String.format("<li>" + 
					"      <a href='#' aria-label='Previous'>" + 
					"        <span aria-hidden='true'>&laquo;</span>" + 
					"      </a>" + 
					"    </li>");
		} else {
			pagebar += String.format("<li>" + 
					"      <a href='/myhome/board/list.do?page=%d' aria-label='Previous'>" + 
					"        <span aria-hidden='true'>&laquo;</span>" + 
					"      </a>" + 
					"    </li>", n-1);
		}
		
		
		
		//페이지 번호 루프
//		while (!(loop > blockSize || n > totalPage)) {
//			
//			if (n == nowPage) {
//				pagebar += String.format(" <a href='#' onclick='event.preventDefault();' style='color:tomato;'>%d</a> ", n);
//			} else {
//				pagebar += String.format(" <a href='/myhome/board/list.do?page=%d'>%d</a> ", n, n);
//			}
//			
//			loop++;
//			n++;
//			
//		}//while
		
		while (!(loop > blockSize || n > totalPage)) {
			
			if (n == nowPage) {
				pagebar += String.format("<li class='active'><a href='#'>%d</a></li>", n);
			} else {
				pagebar += String.format("<li><a href='/myhome/board/list.do?page=%d'>%d</a></li>", n, n);
			}
			
			loop++;
			n++;
			
		}//while
		
		
		//[다음 10페이지]
//		if (n > totalPage) {
//			pagebar += String.format(" <a href='#' onclick='event.preventDefault();'>[다음 %d페이지]</a> ", blockSize);
//		} else {
//			pagebar += String.format(" <a href='/myhome/board/list.do?page=%d'>[다음 %d페이지]</a> ", n, blockSize);
//		}
		
		if (n > totalPage) {
			pagebar += String.format("<li>" + 
					"      <a href='#' aria-label='Next'>" + 
					"        <span aria-hidden='true'>&raquo;</span>" + 
					"      </a>" + 
					"    </li>");
		} else {
			pagebar += String.format("<li>" + 
					"      <a href='/myhome/board/list.do?page=%d' aria-label='Next'>" + 
					"        <span aria-hidden='true'>&raquo;</span>" + 
					"      </a>" + 
					"    </li>", n);
		}
		
		
		pagebar += "</ul>\r\n" + 
				"</nav>	";
		
		
		
		//View.java에서 F5에 의한 조회수 증가 방지 티켓 발급
		session.setAttribute("isRead", "n");
	
		req.setAttribute("pagebar", pagebar);
		
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("nowPage", nowPage);
		
		req.setAttribute("isSearch", isSearch);
		req.setAttribute("column", column);
		req.setAttribute("word", word);
		//req.setAttribute("map", map);
		
		req.setAttribute("list", list);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/list.jsp");
		dispatcher.forward(req, resp);
	}

}










