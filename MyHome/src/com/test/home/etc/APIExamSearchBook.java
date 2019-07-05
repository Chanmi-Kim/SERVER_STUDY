package com.test.home.etc;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class APIExamSearchBook {

	public static void main(String[] args) {
		
		String clientId = "4r8Fi58QZgvYDO8kgrf2";
		String clientSecret = "CnYcLpnpdN";
		
		try {
			
			//검색어
			String text = URLEncoder.encode("자바", "UTF-8");
			
			//Open API
			String apiURL = "https://openapi.naver.com/v1/search/book.json?query=" + text;
			
			
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
			System.out.println(response.toString());
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}





