package com.test.home.mboard;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.home.board.BoardDTO;

@WebServlet("/board/m")
public class MobileBoard extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//MobileBoard.java
		String mode = req.getParameter("mode");
		
		if (mode == null || mode.equals("")) {
			mode = "list";
		} 
		
				
		BoardDAO dao = new BoardDAO();
		
		if (mode.equals("list")) {
			ArrayList<BoardDTO> list = dao.list(null);
			req.setAttribute("list", list);

			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mboard/main.jsp");
			dispatcher.forward(req, resp);
			
		} else if (mode.equals("view")) {
			String seq = req.getParameter("seq");
			BoardDTO dto = dao.get(seq);
			
			resp.setContentType("application/json");
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print("{");
			writer.printf("\"subject\":\"%s\"", dto.getSubject());
			writer.print("}");
			writer.close();
			
		}
	}

}
