package com.test.ajax;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class AjaxDAO {

	private Connection conn;
	private PreparedStatement stat;
	private ResultSet rs;
	
	public AjaxDAO() {
		try {
			
			DBUtil util = new DBUtil();
			conn = util.connect();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	public ResearchDTO get(String seq) {
		
		try {
			
			String sql = "select * from tblResearch where seq = ?";
			
			ResearchDTO dto = new ResearchDTO();
			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			rs = stat.executeQuery();
			
			if (rs.next()) {
				dto.setSeq(rs.getString("seq"));
				dto.setQuestion(rs.getString("question"));
				dto.setItem1(rs.getString("item1"));
				dto.setItem2(rs.getString("item2"));
				dto.setItem3(rs.getString("item3"));
				dto.setItem4(rs.getString("item4"));
				dto.setCnt1(rs.getInt("cnt1"));
				dto.setCnt2(rs.getInt("cnt2"));
				dto.setCnt3(rs.getInt("cnt3"));
				dto.setCnt4(rs.getInt("cnt4"));
			}
			
			return dto;
			
		} catch (Exception e) {
			
			System.out.println("AjaxDAO.get : " + e.toString());
		}
		
		return null;
	}
	
	
	//-------------------------------------------------------------

	public int idcheck(String id) {
		
		try {
			
			String sql = "select count(*) as cnt from tblUser where id = ?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, id);
			
			rs = stat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			
			System.out.println("AjaxDAO.idcheck : " + e.toString());
		}
		
		return 1;
	}
	
}











