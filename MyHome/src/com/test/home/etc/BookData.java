package com.test.home.etc;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/etc/bookdata.do")
public class BookData extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//BookData.java
		
		
		//검색어
		String query = req.getParameter("query");
		
		
		
		String clientId = "4r8Fi58QZgvYDO8kgrf2";
		String clientSecret = "CnYcLpnpdN";
		
		try {
			
			//검색어
			String text = URLEncoder.encode(query, "UTF-8");
			
			//Open API
			String apiURL = "https://openapi.naver.com/v1/search/book.xml?query=" + text;
			
			
			//검색 요청
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			
			int responseCode = con.getResponseCode();
			
			BufferedReader br;
			
			if (responseCode == 200) {
				
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				
			} else { 
				
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				
			}
			
			
			
			//우리가 할 부분
			// - br : 반환받은 데이터가 들어 있음
			//		-> 업무 구현
			String inputLine;
			
			StringBuffer response = new StringBuffer();
			
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			
			br.close();
			
			
			//출력
			//System.out.println(response.toString());
			
			//출력 대신 Response > PrintWriter > 클라이언트 돌려주기
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("text/xml");
			
			PrintWriter writer = resp.getWriter();
			
			writer.print(response.toString());
			
			writer.close();
			
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

}







