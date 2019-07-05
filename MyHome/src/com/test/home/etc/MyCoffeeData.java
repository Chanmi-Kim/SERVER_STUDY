package com.test.home.etc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/etc/mycoffeedata.do")
public class MyCoffeeData extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//MyCoffeeData.java
		String name = req.getParameter("name");
		String lat = req.getParameter("lat");
		String lng = req.getParameter("lng");
		
		MyCoffeeDTO dto = new MyCoffeeDTO();
		dto.setName(name);
		dto.setLat(lat);
		dto.setLng(lng);
		
		EtcDAO dao = new EtcDAO();
		int result = dao.addCoffee(dto);
		
		resp.setContentType("application/json");//MIME
		
		PrintWriter writer = resp.getWriter();
		
		//{
		//		"result": "1"
		//}
		writer.print("{");
		writer.printf("\"result\":\"%d\"", result);
		writer.print("}");
		
		writer.close();
		
	}

}













