package com.test.home.etc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/etc/chart.do")
public class Chart extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Chart.java
		
		EtcDAO dao = new EtcDAO();
		ArrayList<ChartDTO> list = dao.list();
		
		ArrayList<ArrayList<ChartDTO>> listAll = dao.listAll();

		req.setAttribute("list", list);
		req.setAttribute("listAll", listAll);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/etc/chart.jsp");
		dispatcher.forward(req, resp);
	}

}




















