package com.test.home.member;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.test.home.AuthCheck;

@WebServlet("/member/addok.do")
public class AddOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//인증 사용자?
		AuthCheck auth = new AuthCheck(req.getSession(), resp);
		auth.allow();

		//AddOk.java
		//0. MultipartRequest 생성
		//1. 데이터 가져오기
		//2. 첨부 파일 처리
		//3. DB 작업 > DAO 위임(insert)
		//4. 결과 반환 + JSP 호출
		
		req.setCharacterEncoding("UTF-8");
		
		//cos.jar
		MultipartRequest multi = new MultipartRequest(
													req,
													req.getRealPath("/pic"),
													1024 * 1024 * 10,
													"UTF-8",
													new DefaultFileRenamePolicy()
												);
		
		//데이터 가져오기
		String name = multi.getParameter("name");
		String nick = multi.getParameter("nick");
		String id = multi.getParameter("id");
		String pw = multi.getParameter("pw");
		
		String pic = multi.getFilesystemName("pic");//하드 저장된 사진 파일 명
		
		//첨부 파일명 바꾸기
		//System.out.println(pic == null);
		//System.out.println(pic == "");
		
		if (pic != null) {
			//man_01.png > hong.png
			File file = new File(req.getRealPath("/pic") + "\\" + pic);
			//System.out.println(file.exists());
			File file2 = new File(req.getRealPath("/pic") + "\\" + id + ".png");
			
			file.renameTo(file2);//사진을 아이디로 이름 바꾸기
			
			pic = id + ".png";
		} else {
			pic = "nopic.png";
		}
		
		//디버깅
		//System.out.println("name : " + name);
		//System.out.println("pic : " + pic);
		//System.out.println(req.getRealPath("/pic"));
		
		
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setName(name);
		dto.setNick(nick);
		dto.setPw(pw);
		dto.setPic(pic);
		
		MemberDAO dao = new MemberDAO();
		
		int result = dao.add(dto);
		
		req.setAttribute("result", result);		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/addok.jsp");
		dispatcher.forward(req, resp);
	}

}

















