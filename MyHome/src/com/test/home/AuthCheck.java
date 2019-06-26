package com.test.home;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthCheck {

	private HttpSession session;
	private HttpServletResponse resp;

	public AuthCheck(HttpSession session, HttpServletResponse resp) {
		this.session = session;
		this.resp = resp;
	}

	public void allow() {

		if (this.session.getAttribute("id") == null) {
			// 로그인 안한 사람 > 쫒아내기!!!

			try {

				resp.setCharacterEncoding("UTF-8");
				PrintWriter writer = resp.getWriter();

				writer.println("<html>");
				writer.println("<meta charset='utf-8'>");
				writer.println("<body>");
				writer.println("<script>");
				writer.println("alert('회원만 접근 가능합니다.');");
				writer.println("location.href = '/myhome/member/index.do';");
				writer.println("</script>");
				writer.println("</body>");
				writer.println("</html>");

				writer.close();

			} catch (IOException e) {
				e.printStackTrace();
			}

		}
	}

	public void allow2(String id) {

		// 수정하기 + 삭제하기
		// 본인 확인 || 관리자 확인
		if (!this.session.getAttribute("id").toString().equals(id)
				&& this.session.getAttribute("lv").toString().equals("1")) {

			try {

				resp.setCharacterEncoding("UTF-8");
				PrintWriter writer = resp.getWriter();

				writer.println("<html>");
				writer.println("<meta charset='utf-8'>");
				writer.println("<body>");
				writer.println("<script>");
				writer.println("alert('작성자만 접근 가능합니다.');");
				writer.println("location.href = '/myhome/member/index.do';");
				writer.println("</script>");
				writer.println("</body>");
				writer.println("</html>");

				writer.close();

			} catch (IOException e) {
				e.printStackTrace();
			}

		}

	}

}
