package com.test.home.etc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/etc/map.do")
public class Map extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Map.java
		//map.do?no=91
		String no = req.getParameter("no");
		if (no == null || no.equals("")) no = "01";
		
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/etc/map" + no + ".jsp");
		dispatcher.forward(req, resp);
	}

}






