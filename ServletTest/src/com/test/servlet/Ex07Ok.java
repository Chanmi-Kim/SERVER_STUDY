package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex07Ok extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//request, response 객체 역할
		
		req.setCharacterEncoding("UTF-8");
		
		//인코딩
		
		//데이터 가져오기
		//<input type="text" name="txt1">
		
		//getParameter()
		// - 값을 입력하지 않았을 때 ""을 반환한다.
		// - 참조할 값이 없으면 null을 반환한다.
		
		String txt1 = req.getParameter("txt1");
		
		if (txt1 != null) {
			if (txt1 != "") {
				System.out.println(txt1);			
			} else {
				System.out.println("사용자가 값을 입력하지 않았습니다.");
			}
		} else {
			System.out.println("txt1이 존재하지 않습니다.");
		}
		
		//암호 박스
		String pw1 = req.getParameter("pw1");
		
		//다중 라인 박스
		String txt2 = req.getParameter("txt2");
		
		//체크 박스
		//1. value 지정 X
		//		1. 체크O > "on"
		//		2. 체크X > null
		//2. value 지정 O
		//		1. 체크O > value > 바로 업무에 적용하기 좋음
		//		2. 체크X > null
		String cb1 = req.getParameter("cb1");
		
		//체크 박스들
//		String cb2 = req.getParameter("cb2");
//		String cb3 = req.getParameter("cb3");
//		String cb4 = req.getParameter("cb4");
//		
//		String result = "";
//		
//		if (cb2 != null) result += cb2 + ",";
//		if (cb3 != null) result += cb3 + ",";
//		if (cb4 != null) result += cb4;
		
		String result = "";
		
		for (int i=2; i<=4; i++) {
			String temp = req.getParameter("cb" + i);
			if (temp != null) result += temp + ",";
		}
		
		
		//체크 박스들
		//String cbs = req.getParameter("cbs");
		String[] cbs = req.getParameterValues("cbs");
		
		
		//라디오 버튼
		//req.getParameter() //O
		//req.getParameterValues() //X
		String rb = req.getParameter("rb");
		
		
		//셀렉트 박스
		String sel1 = req.getParameter("sel1"); //라디오
		
		String[] sel2 = req.getParameterValues("sel2"); //체크
		
		
		
		//히든 태그
		String seq = req.getParameter("seq");
		
		
		
		//HTML5
		String r1 = req.getParameter("r1");
		
		
		
		resp.setCharacterEncoding("UTF-8");
		PrintWriter writer = resp.getWriter();

		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='UTF-8'>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<div>txt1 : " + txt1 + "</div>");
		writer.printf("<div>%s</div>", pw1);
		writer.printf("<p>%s</p>", txt2.replace("\r\n", "<br>"));
		writer.printf("<div>cb1 : %s</div>", cb1);
		writer.printf("<div>result : %s</div>", result);
		writer.printf("<div>cbs : %s</div>", Arrays.toString(cbs));
		
		writer.printf("<div>rb : %s</div>", rb);
		writer.printf("<div>sel1 : %s</div>", sel1);
		writer.printf("<div>sel2 : %s</div>", Arrays.toString(sel2));
		
		writer.printf("<div>seq : %s</div>", seq);
		writer.printf("<div>r1 : %s</div>", r1);
		
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
		
		
	}

}
