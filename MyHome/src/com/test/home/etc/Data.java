package com.test.home.etc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.home.member.MemberDTO;

@WebServlet("/etc/data.do")
public class Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Data.java
		//차트 출력에 필요한 여러 데이티셋 가져오기
		
		
		EtcDAO dao = new EtcDAO();
		
		//유저별 등록 게시물 수
		ArrayList<ChartDTO1> list1 = dao.list1();
		
		//유저 목록
		ArrayList<MemberDTO> mlist = dao.mlist();
		
		//select + 첫번째 유저의 데이터 가져오기
		ArrayList<ChartDTO2> list2 = dao.list2();
		
		

		req.setAttribute("list1", list1);
		req.setAttribute("mlist", mlist);
		req.setAttribute("list2", list2);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/etc/data.jsp");
		dispatcher.forward(req, resp);
	}

}










