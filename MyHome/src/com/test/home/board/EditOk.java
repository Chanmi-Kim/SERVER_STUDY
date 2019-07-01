package com.test.home.board;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
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
				
		
//		String subject = req.getParameter("subject");
//		String content = req.getParameter("content");
//		String tag = req.getParameter("tag");
//		
//		//관리자 : 0 or 1
//		//일반 : null > 0
//		String notice = req.getParameter("notice");
//		if (notice == null) notice = "0";
		
		
		
		String subject = "";
		String content = "";
		String tag = "";
		String filename = "";
		String orgfilename = "";
		String seq = "";
		
		String hash = "";
		
		try {
			
			System.out.println(req.getRealPath("/files"));
			
			//WebContent > files
			MultipartRequest multi = new MultipartRequest(
																req,
																req.getRealPath("/files"),
																1024 * 1024 * 100,
																"UTF-8",
																new DefaultFileRenamePolicy()
															); //이 순간 > 첨부 파일 저장 완료
			

			subject = multi.getParameter("subject");
			content = multi.getParameter("content");
			tag = multi.getParameter("tag");
			seq = multi.getParameter("seq");
			
			hash = multi.getParameter("hash");
			
			filename = multi.getFilesystemName("attach"); //새로운 파일명ㄹ
			orgfilename = multi.getOriginalFileName("attach");

			//System.out.println(filename == null);
			//System.out.println(filename == "");
			
			if (filename == null) {
				
				if (multi.getParameter("isdelete") != "") {
					File file = new File(req.getRealPath("/files") + "\\" + multi.getParameter("isdelete"));
					file.delete();
				}
				
				//파일을 그대로 두겠다.
				filename = multi.getParameter("filename");
				orgfilename = multi.getParameter("orgfilename");
				
			} else {
				//새로운 첨부 파일 선택
				//물리적 : 기존 파일 삭제
				//DB: 새로운 파일명으로 교체
				File file = new File(req.getRealPath("/files") + "\\" + multi.getParameter("filename"));
				file.delete();
			}
			
			
			
		} catch (Exception e) {
			
			System.out.println("AddOk.doPost : " + e.toString());
		}
		
		
		//2.
		BoardDTO dto = new BoardDTO();
		
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setTag(tag);
		dto.setSeq(seq);
		dto.setFilename(filename);
		dto.setOrgfilename(orgfilename);
		
		BoardDAO dao = new BoardDAO();
		
		int result = dao.edit(dto);
		
		
		//기존에 있던 태그 삭제
		dao.delHash(seq);
		
		
		//해시 태그 처리
		if (hash != null && !hash.equals("")) {
			
			//공백 제거
			hash = hash.replace(" ", "");
			
			//쪼개기
			String[] htemp = hash.split(",");
			
			for (String hitem : htemp) {
				
				dao.addHash(hitem);
				
				String hseq = dao.getHseq(hitem);
				
				//JSP > 25, 1
				//Servlet > 25, 5
				//수업 예제 > 25, 7
				dao.addHashBoard(seq, hseq);
				
			}
			
		}
		
		
		
		req.setAttribute("result", result);
		req.setAttribute("seq", seq);


		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/editok.jsp");
		dispatcher.forward(req, resp);
	}

}








