package com.test.home.mboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.home.DBUtil;
import com.test.home.board.BoardDTO;

public class BoardDAO {

	private Connection conn;
	private PreparedStatement stat;
	private ResultSet rs;
	
	public BoardDAO() {
		
		DBUtil util = new DBUtil();
		conn = util.connect();
		
	}

	public ArrayList<BoardDTO> list(HashMap<String, String> map) {
		
		try {
			
			
			String sql = String.format("select 0, a.* from vwBoard a where notice = 1 union select * from " + 
					"    (select rownum as rnum, a.* from " + 
					"        (select * from vwBoard where notice = 0 order by thread desc) a) " + 
					"            where rnum between 1 and 10");
			
			stat = conn.prepareStatement(sql);
			
			rs = stat.executeQuery();
			
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
			while (rs.next()) {
				//레코드 1개 > DTO 1개
				BoardDTO dto = new BoardDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getInt("readcount"));
				
				dto.setGap(rs.getInt("gap"));//최신글
				dto.setCommentcount(rs.getInt("commentcount"));//댓글수
				
				dto.setNotice(rs.getString("notice"));//공지글
				
				dto.setFilename(rs.getString("filename"));//파일명
				
				dto.setDepth(rs.getInt("depth")); //답변형
				
				list.add(dto);				
			}
			
			return list;
			
			
		} catch (Exception e) {
			
			System.out.println("BoardDAO.list : " + e.toString());
		}
		
		return null;
	}

	public BoardDTO get(String seq) {
		try {
			
			String sql = "select b.*, (select name from tblMember where id = b.id) as name from tblBoard b where seq = ?";
		
			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			rs = stat.executeQuery();
			
			BoardDTO dto = new BoardDTO();
			
			if (rs.next()) {
				
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setUserip(rs.getString("userip"));
				dto.setTag(rs.getString("tag"));
				dto.setName(rs.getString("name"));//*
				
				dto.setFilename(rs.getString("filename"));
				dto.setOrgfilename(rs.getString("orgfilename"));
				dto.setDownloadcount(rs.getString("downloadcount"));
				
				dto.setThread(rs.getInt("thread"));//답변형
				dto.setDepth(rs.getInt("depth"));
				
				return dto;
			}
			
			
		} catch (Exception e) {
			
			System.out.println("BoardDAO.get : " + e.toString());
		}
		
		return null;
	}
	
}
















