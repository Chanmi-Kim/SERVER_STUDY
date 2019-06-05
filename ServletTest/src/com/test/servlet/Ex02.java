package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex02 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
											throws ServletException, IOException {
		
		resp.setCharacterEncoding("UTF-8");
		PrintWriter writer = resp.getWriter();
		
		writer.print("<!DOCTYPE html>\r\n" + 
				"<html lang=\"en\">\r\n" + 
				"<head>\r\n" + 
				"     <meta charset=\"UTF-8\">\r\n" + 
				"     <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n" + 
				"     <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\r\n" + 
				"     <title>Document</title>\r\n" + 
				"</head>\r\n" + 
				"<body>\r\n" + 
				"     <h1>Hello</h1>\r\n" + 
				"     <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ab esse porro consectetur magnam ad eius nam placeat fuga sequi excepturi. Eius doloribus suscipit incidunt voluptas sapiente libero, dolorum tempora placeat!</p>\r\n" + 
				"</body>\r\n" + 
				"</html>");
		writer.close();
		
		
	}
	
}
