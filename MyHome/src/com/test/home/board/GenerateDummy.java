package com.test.home.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Calendar;
import java.util.Random;

import com.test.home.DBUtil;

public class GenerateDummy {
	
	public static void main(String[] args) {
		
		//게시물 작성
		String[] id = { "hong", "test", "admin" };
		String[] word = { "안녕", "잘가", "테스트", "게시판", "JSP", "서블릿", "MVC 패턴", "점심", "아메리카노", "라테", "비엔나", "카푸치노", "강아지", "고양이", "병아리", "말" };
		
		//BoardDAO.add
		String sql = "insert into tblBoard (seq, id, subject, content, regdate, readcount, userip, tag, notice) values (board_seq.nextval, ?, ?, ?, ?, default, '211.63.89.31', 'n', 0)";
		
		try {
			
			DBUtil util = new DBUtil();
			Connection conn = util.connect();
			PreparedStatement stat = conn.prepareStatement(sql);
			
			Random rnd = new Random();
			Calendar c = Calendar.getInstance();
			c.set(Calendar.DATE, -204);
			
			for (int i=0; i<234; i++) {
				
				stat.setString(1, id[rnd.nextInt(id.length)]);//id
				stat.setString(2, word[rnd.nextInt(word.length)] + " " + word[rnd.nextInt(word.length)] + " " + word[rnd.nextInt(word.length)] + " " + word[rnd.nextInt(word.length)] + " " + word[rnd.nextInt(word.length)]);
				stat.setString(3, word[rnd.nextInt(word.length)] + " " + word[rnd.nextInt(word.length)] + " " + word[rnd.nextInt(word.length)] + " " + word[rnd.nextInt(word.length)] + " " + word[rnd.nextInt(word.length)]);
				stat.setString(4, String.format("%tF", c));
				c.add(Calendar.DATE, 1);
				
				stat.executeUpdate();
				
				System.out.println(i + " inserted.");
			}
			
		} catch (Exception e) {
			
			System.out.println("GenerateDummy.main : " + e.toString());
		}
		
	}

}











