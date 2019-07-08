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
		String mode = req.getParameter("mode");
		
		if (mode == null || mode.equals("")) {
			add(req, resp);
		} else if (mode.equals("edit")) {
			edit(req, resp);
		} else if (mode.equals("del")) {
			del(req, resp);
		}
		
	}

	private void edit(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		String name = req.getParameter("name");
		String seq = req.getParameter("seq");
		
		MyCoffeeDTO dto = new MyCoffeeDTO();
		dto.setName(name);
		dto.setSeq(seq);
		
		EtcDAO dao = new EtcDAO();
		int result = dao.editCoffee(dto);
		
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

	private void del(HttpServletRequest req, HttpServletResponse resp)  throws IOException {
		
		String seq = req.getParameter("seq");
		
		MyCoffeeDTO dto = new MyCoffeeDTO();
		dto.setSeq(seq);
		
		EtcDAO dao = new EtcDAO();
		int result = dao.delCoffee(dto);
		
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

	private void add(HttpServletRequest req, HttpServletResponse resp) throws IOException {
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













