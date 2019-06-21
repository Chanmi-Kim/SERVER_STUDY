package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex09text.do")
public class Ex09Text extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//ex09data.do?type=text&data=호랑이

		//Ex09Text.java
		// -  Ajax 객체의 요청에 응답하는 서블릿
		//		: 돌려줄 데이터를 text | xml | json 선택
		
		//1. 데이터 가져오기(동물)
		//2. DB 작업 > DAO 위임(insert)
		//3. DB 작업 > DAO 위임(select)
		//4. 결과 반환 + JSP 호출 > Text 기반으로 반환 데이터를 작성
		
		//1.
		String type = req.getParameter("type");
		String data = req.getParameter("data");
		
		//2.
		AnimalDTO dto = new AnimalDTO();
		dto.setType(type);
		dto.setData(data);
		
		AjaxDAO dao = new AjaxDAO();
		
		dao.add(dto);
		
		ArrayList<AnimalDTO> list = dao.data(dto);
		
		req.setAttribute("list", list);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex09text.jsp");
		dispatcher.forward(req, resp);
	}

}


























