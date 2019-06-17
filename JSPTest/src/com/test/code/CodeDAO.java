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
	
}












