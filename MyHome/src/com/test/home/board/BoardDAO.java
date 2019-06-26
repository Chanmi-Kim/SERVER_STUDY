package com.test.home.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.home.DBUtil;

public class BoardDAO {

	private Connection conn;
	private PreparedStatement stat;
	private ResultSet rs;
	
	public BoardDAO() {
		
		DBUtil util = new DBUtil();
		conn = util.connect();
		
	}

	public int add(BoardDTO dto) {
		
		try {
			
			String sql = "insert into tblBoard (seq, id, subject, content, regdate, readcount, userip, tag) values (board_seq.nextval, ?, ?, ?, default, default, ?, ?)";
			
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, dto.getId());
			stat.setString(2, dto.getSubject());
			stat.setString(3, dto.getContent());
			stat.setString(4, dto.getUserip());
			stat.setString(5, dto.getTag());
			
			return stat.executeUpdate();			
			
		} catch (Exception e) {
			
			System.out.println("BoardDAO.add : " + e.toString());
		}
		
		return 0;
	}

	public ArrayList<BoardDTO> list(HashMap<String, String> map) {
		
		try {
			
			String where = "";
			
			if (map.get("isSearch").equals("true")) {
				where = String.format("where %s like '%%%s%%'"
														, map.get("column")
														, map.get("word"));
			}
			
			String sql = String.format("select * from vwBoard %s order by seq desc", where);
			
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
				
				return dto;
			}
			
			
		} catch (Exception e) {
			
			System.out.println("BoardDAO.get : " + e.toString());
		}
		
		return null;
	}

	public void addReadcount(String seq) {
		
		try {
			
			String sql = "update tblBoard set readcount = readcount + 1 where seq = ?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			stat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("BoardDAO.addReadcount : " + e.toString());
		}
		
	}
	
	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int edit(BoardDTO dto) {
		
		try {
			
			String sql = "update tblBoard set subject = ?, content = ?, tag = ? where seq = ?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getSubject());
			stat.setString(2, dto.getContent());
			stat.setString(3, dto.getTag());
			stat.setString(4, dto.getSeq());
			
			return stat.executeUpdate();
			
		} catch (Exception e) {
			
			System.out.println("BoardDAO.edit : " + e.toString());
		}
		
		return 0;
	}

	public int del(String seq) {
		
		try {
			
			String sql = "delete from tblBoard where seq = ?";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			return stat.executeUpdate();			
			
		} catch (Exception e) {
			
			System.out.println("BoardDAO.del : " + e.toString());
		}
		
		return 0;
	}

	public void addSearch(SearchDTO sdto) {
		
		try {
			
			String sql = "insert into tblSearch (seq, columnName, word, regdate, id) values (search_seq.nextval, ?, ?, default, ?)";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, sdto.getColumnName());
			stat.setString(2, sdto.getWord());
			stat.setString(3, sdto.getId());
			
			stat.executeUpdate();			
			
		} catch (Exception e) {
			
			System.out.println("BoardDAO.addSearch : " + e.toString());
		}
		
	}

	public int addComment(CommentDTO cdto) {
		
		try {
			
			String sql = "insert into tblComment (seq, content, id, regdate, pseq) values (comment_seq.nextval, ?, ?, default, ?)";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, cdto.getContent());
			stat.setString(2, cdto.getId());
			stat.setString(3, cdto.getPseq());
			
			return stat.executeUpdate();			
			
		} catch (Exception e) {
			
			System.out.println("BoardDAO.addComment : " + e.toString());
		}
		
		return 0;
	}

	public ArrayList<CommentDTO> listComment(String seq) {
		
		try {
			
			String sql = "select c.*, (select name from tblMember where id = c.id) as name from tblComment c where pseq = ? order by seq desc";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			ArrayList<CommentDTO> clist = new ArrayList<CommentDTO>();
			rs = stat.executeQuery();
			
			while (rs.next()) {
				
				CommentDTO cdto = new CommentDTO();
				
				cdto.setSeq(rs.getString("seq"));
				cdto.setContent(rs.getString("content"));
				cdto.setName(rs.getString("name"));
				cdto.setId(rs.getString("id"));
				cdto.setRegdate(rs.getString("regdate"));
				cdto.setPseq(rs.getString("pseq"));
				
				clist.add(cdto);
			}
			
			return clist;
			
		} catch (Exception e) {
			
			System.out.println("BoardDAO.listComment : " + e.toString());
		}
		
		return null;
	}
	
}
















