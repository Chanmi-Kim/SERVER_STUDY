package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex03 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setCharacterEncoding("UTF-8");
		PrintWriter writer = resp.getWriter();
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='utf-8'>");
		writer.println("<style> div { margin-bottom: 5px; } </style>");
		writer.println("</head>");
		writer.println("<body>");		
		
		//구구단 출력(랜덤)
		Random rnd = new Random();
		int dan = rnd.nextInt(19) + 1;
		
		writer.println("<h1>" + dan + "단</h1>");
		
		for (int i=1; i<=19; i++) {
			//System.out.println();
			//<div>5 x 1 = 5</div>
			//writer.print("<div>" + dan + " x " + i + " = " + (dan * i) + "</div>");
			writer.printf("<div>%d x %d = %d</div>\r\n", dan, i, (dan * i));
		}
		
		writer.println("</body>");
		writer.println("</html>");
				
		writer.close();
		
	}
	
}
