package com.test.code;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CodeDAO {

	private Connection conn;
	private PreparedStatement stat;
	private ResultSet rs;
	
	public CodeDAO() {
		try {
			
			DBUtil util = new DBUtil();
			conn = util.connect();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	//카테고리 목록
	public ArrayList<CategoryDTO> clist() {
		
		try {
			
			ArrayList<CategoryDTO> list = new ArrayList<CategoryDTO>();
			
			String sql = "select * from tblCategory order by seq asc";
			stat = conn.prepareStatement(sql);
			
			rs = stat.executeQuery();
			
			//rs -> list
			while (rs.next()) {
				//레코드 1개 -> DTO 1개
				CategoryDTO dto = new CategoryDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setColor(rs.getString("color"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return null;
	}

	public int add(CodeDTO dto) {
		
		try {
			
			String sql = "insert into tblCode (seq, category, subject, code, description, regdate) values (code_seq.nextval, ?, ?, ?, ?, default)";
			
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, dto.getCategory());
			stat.setString(2, dto.getSubject());
			stat.setString(3, dto.getCode());
			stat.setString(4, dto.getDescription());
			
			return stat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return 0;
	}

	public ArrayList<CodeDTO> list() {
		
		try {
			
			ArrayList<CodeDTO> list = new ArrayList<CodeDTO>();
			
			String sql = "select seq, subject, category, (select name from tblCategory where seq = c.category) as categoryName, (select color from tblCategory where seq = c.category) as categoryColor, regdate from tblCode c order by regdate desc";
			
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery();
			
			while (rs.next()) {
				CodeDTO dto = new CodeDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setCategory(rs.getString("category"));
				dto.setCategoryName(rs.getString("categoryName"));//신규
				dto.setCategoryColor(rs.getString("categoryColor"));//신규
				dto.setSubject(rs.getString("subject"));
				dto.setRegdate(rs.getString("regdate"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return null;
	}

	public CodeDTO get(String seq) {
		
		try {
			
			CodeDTO dto = new CodeDTO();
			
			String sql = "select seq, subject, category, (select name from tblCategory where seq = c.category) as categoryName, (select color from tblCategory where seq = c.category) as categoryColor, regdate, code, description from tblCode c where seq = ?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			rs = stat.executeQuery();
			
			if (rs.next()) {
				dto.setSeq(rs.getString("seq"));
				dto.setCategory(rs.getString("category"));
				dto.setCategoryName(rs.getString("categoryName"));
				dto.setCategoryColor(rs.getString("categoryColor"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setCode(rs.getString("code"));
				dto.setDescription(rs.getString("description"));
			}
			
			return dto;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return null;
	}

	public int edit(CodeDTO dto) {
		
		try {
			
			String sql = "update tblCode set category = ?, subject = ?, code = ?, description = ? where seq = ?";
			
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, dto.getCategory());
			stat.setString(2, dto.getSubject());
			stat.setString(3, dto.getCode());
			stat.setString(4, dto.getDescription());
			stat.setString(5, dto.getSeq());
			
			return stat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return 0;
	}

	public int del(String seq) {
		
		try {
			
			String sql = "delete from tblCode where seq = ?";
			
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, seq);
			
			return stat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return 0;
	}
	
}












