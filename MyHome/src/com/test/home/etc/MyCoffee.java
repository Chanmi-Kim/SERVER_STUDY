package com.test.home.etc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/etc/mycoffee.do")
public class MyCoffee extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//MyCoffee.java
		EtcDAO dao = new EtcDAO();
		
		ArrayList<MyCoffeeDTO> list = dao.listCoffee();
		
		req.setAttribute("list", list);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/etc/mycoffee.jsp");
		dispatcher.forward(req, resp);
	}

}








