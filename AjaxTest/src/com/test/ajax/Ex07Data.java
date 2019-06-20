package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex07data.do")
public class Ex07Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex07Data.java
		//1. 데이터 가져오기(deparment)
		//2. DB 작업 > DAO 위임(select where)
		//3. 결과 반환(ArrayList<DTO>)
		//4. PrintWriter > XML 문서 만들기
		
		//ex07data.do?department=기획부
		
		//1.
		String deparment = req.getParameter("department");
		
		//2. + 3.
		AjaxDAO dao = new AjaxDAO();
		ArrayList<InsaDTO> list = dao.list(deparment);
		
		//4. ArrayList<InsaDTO> -> XML 형태 변환
		/*
		<?xml version="1.0" encoding="utf-8"?>
		<list>
			<insa>
				<num>1</num>
				<name>홍길동</name>
				<jikwi>부장</jikwi>
				<tel>010</tel>
				<city>서울</city>
			</insa>
		</list>
		*/
		
		resp.setCharacterEncoding("UTF-8");
		PrintWriter writer = resp.getWriter();
		
		writer.println("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
		writer.println("<list>");
		
		for (InsaDTO dto : list) {
			
			writer.println("<insa>");
				writer.println("<num>" + dto.getNum() + "</num>");
				writer.println("<name>" + dto.getName() + "</name>");
				writer.println("<jikwi>" + dto.getJikwi() + "</jikwi>");
				writer.println("<tel>" + dto.getTel() + "</tel>");
				writer.println("<city>" + dto.getCity() + "</city>");
			writer.println("</insa>");
		}
		
		writer.println("</list>");
	}

}























