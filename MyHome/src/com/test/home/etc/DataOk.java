package com.test.home.etc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/etc/dataok.do")
public class DataOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//DataOk.java
		//1. 데이터 가져오기(id)
		//2. DB 작업 > DAO 위임(select where)
		//3. 결과 반환(ChartDTO2) + JSON 반환
		
		String id = req.getParameter("id");
		
		EtcDAO dao = new EtcDAO();
		
		ChartDTO2 dto = dao.get(id);
		
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		/*
		
		{
			"cnt1": "10",
			"cnt2": "5"
		}
		
		*/
		writer.println("{");
		writer.println(String.format("\"cnt1\": \"%d\",", dto.getCnt1()));
		writer.println(String.format("\"cnt2\": \"%d\"", dto.getCnt2()));
		writer.println("}");
		
		writer.close();
		
	}

}






