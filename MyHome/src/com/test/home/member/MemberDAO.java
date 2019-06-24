package com.test.home.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.test.home.DBUtil;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement stat;
	private ResultSet rs;
	
	public MemberDAO() {
		
		DBUtil util = new DBUtil();
		conn = util.connect();
		
	}

	public int add(MemberDTO dto) {
		
		try {
			
			String sql = "insert into tblMember (id, name, nick, pw, pic, lv) values (?, ?, ?, ?, ?, 1)";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getId());
			stat.setString(2, dto.getName());
			stat.setString(3, dto.getNick());
			stat.setString(4, dto.getPw());
			stat.setString(5, dto.getPic());
			
			return stat.executeUpdate();			
			
		} catch (Exception e) {
			
			System.out.println("MemberDAO.add : " + e.toString());
		}
		
		return 0;
	}

	public MemberDTO login(MemberDTO dto) {
		
		try {
			
			String sql = "select * from tblMember where id = ? and pw = ?";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getId());
			stat.setString(2, dto.getPw());
			
			MemberDTO result = new MemberDTO();
			
			rs = stat.executeQuery();
			
			if (rs.next()) {
				//로그인 O
				result.setId(rs.getString("id"));
				result.setLv(rs.getInt("lv"));
				result.setName(rs.getString("name"));
				result.setNick(rs.getString("nick"));
				result.setPic(rs.getString("pic"));
				result.setPoint(rs.getInt("point"));
				result.setRegdate(rs.getString("regdate"));
				
				return result;
			} else {
				//로그인 X
				return null;
			}
			
		} catch (Exception e) {
			
			System.out.println("MemberDAO.login : " + e.toString());
		}
		
		return null;
	}

	public int del(String id) {
		
		try {
			
			String sql = "update tblMember set name='anonymous', pw='1', point = 0, nick='1', regdate = sysdate, pic = '1' where id = ?";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, id);
			 
			return stat.executeUpdate();
			
		} catch (Exception e) {
			
			System.out.println("MemberDAO.del : " + e.toString());
		}
		
		return 0;
	}
	
}











