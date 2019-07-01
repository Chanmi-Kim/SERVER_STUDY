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
			
			String sql = "insert into tblBoard (seq, id, subject, content, regdate, readcount, userip, tag, notice, filename, orgfilename, downloadcount, thread, depth) values (board_seq.nextval, ?, ?, ?, default, default, ?, ?, ?, ?, ?, default, ?, ?)";
			
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, dto.getId());
			stat.setString(2, dto.getSubject());
			stat.setString(3, dto.getContent());
			stat.setString(4, dto.getUserip());
			stat.setString(5, dto.getTag());
			stat.setString(6, dto.getNotice());
			stat.setString(7, dto.getFilename());
			stat.setString(8, dto.getOrgfilename());
			stat.setInt(9, dto.getThread());
			stat.setInt(10, dto.getDepth());
			
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
				where = String.format("and %s like '%%%s%%'"
														, map.get("column")
														, map.get("word"));
			}
			
			
			String tag = "";
			
			if (map.containsKey("tag")) {
				tag = String.format(" and seq in (select pseq from tblHashBoard " + 
							"  where hseq = (select seq from tblHash where tag = '%s'))"
															, map.get("tag"));
			}
			
			
			//String sql = String.format("select * from vwBoard %s order by seq desc", where);
			
			//order by notice desc, seq desc
			String sql = String.format("select 0, a.* from vwBoard a where notice = 1 union select * from " + 
					"    (select rownum as rnum, a.* from " + 
					"        (select * from vwBoard where notice = 0 %s order by thread desc) a) " + 
					"            where rnum between %s and %s %s"
																, where
																, map.get("begin")
																, map.get("end")
																, tag);
			
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
			
			String sql = "update tblBoard set subject = ?, content = ?, tag = ?, filename = ?, orgfilename = ? where seq = ?";
			
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, dto.getSubject());
			stat.setString(2, dto.getContent());
			stat.setString(3, dto.getTag());
			stat.setString(4, dto.getFilename());
			stat.setString(5, dto.getOrgfilename());
			stat.setString(6, dto.getSeq());
			
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

	public int editComment(CommentDTO cdto) {
		
		try {
			
			String sql = "update tblComment set content = ? where seq = ?";
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, cdto.getContent());
			stat.setString(2, cdto.getSeq());
			
			return stat.executeUpdate();
			
		} catch (Exception e) {
			
			System.out.println("BoardDAO.editComment : " + e.toString());
		}
		
		return 0;
	}

	public int delComment(String seq) {
		
		try {
			
			String sql = "delete from tblComment where seq = ?";
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, seq);
			
			return stat.executeUpdate();
			
		} catch (Exception e) {
			
			System.out.println("BoardDAO.delComment : " + e.toString());
		}
		
		return 0;
	}

	public int getTotalCount(HashMap<String, String> map) {
		
		try {
			
			String where = "";
			
			if (map.get("isSearch").equals("true")) {
				where = String.format("where %s like '%%%s%%'"
														, map.get("column")
														, map.get("word"));
			}
			
			
			//getTotalCount()			
			//String sql = String.format("select count(*) as cnt from tblBoard %s"
			//												, where);
			String sql = String.format("select count(*) as cnt from vwBoard %s"
																	, where);
															
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery();
			
			if (rs.next()) {
				
				return rs.getInt("cnt");
			}		
			
		} catch (Exception e) {
			
			System.out.println("BoardDAO.getTotalCount : " + e.toString());
		}
		
		return 0;
	}

	public void updateDownloadCount(String seq) {
		
		try {
			
			String sql = "update tblBoard set downloadcount = downloadcount + 1 where seq = ?";

			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			stat.executeUpdate();
			
		} catch (Exception e) {
			
			System.out.println("BoardDAO.updateDownloadCount : " + e.toString());
		}
		
	}

	public int delAllComment(String seq) {
		
		try {
			
			String sql = "delete from tblComment where pseq = ?";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			int result = stat.executeUpdate();
			
			return result >= 1 ? 1 : 0;			
			
		} catch (Exception e) {
			
			System.out.println("BoardDAO.delAllComment : " + e.toString());
		}
		
		return 0;
	}

	public int getMaxThread() {
		
		try {
			
			String sql = "select nvl(max(thread), 0) + 1000 as thread from tblBoard";
			
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("thread");
			}
			
		} catch (Exception e) {
			
			System.out.println("BoardDAO.getMaxThread : " + e.toString());
		}
		
		return 0;
	}

	public void updateThread(int parentThread, int previousThread) {
		
		try {
			
			String sql = "update tblBoard set thread = thread - 1 where thread > ? and thread < ?";
			
			stat = conn.prepareStatement(sql);
			stat.setInt(1, previousThread);
			stat.setInt(2, parentThread);
			
			stat.executeUpdate();
			
		} catch (Exception e) {
			
			System.out.println("BoardDAO.updateThread : " + e.toString());
		}
		
	}

	public void addHash(String hitem) {
		
		try {
			
			String sql = "select count(*) as cnt from tblHash where tag = ?";
			stat = conn.prepareStatement(sql);	
			stat.setString(1, hitem);
			rs = stat.executeQuery();
			
			if (rs.next()) {
				if (rs.getInt("cnt") == 0) {
					//처음 본다. > insert
					rs.close();
					stat.close();
					
					sql = "insert into tblHash (seq, tag) values (hash_seq.nextval, ?)";
					stat = conn.prepareStatement(sql);
					stat.setString(1, hitem);
					
					stat.executeUpdate();
					
				} else {
					//이미 있다. > 아무 것도 안함
				}
			}
			
			
		} catch (Exception e) {
			
			System.out.println("BoardDAO.addHash : " + e.toString());
		}
		
	}

	public String getSeq() {
		
		try {
			
			String sql = "select max(seq) as seq from tblBoard";
			
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery();
			
			if (rs.next()) {
				return rs.getString("seq");
			}
			
		} catch (Exception e) {
			
			System.out.println("BoardDAO.getSeq : " + e.toString());
		}
		
		return null;
	}

	public String getHseq(String hitem) {
		
		try {
			
			String sql = "select seq from tblHash where tag = ?";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, hitem);
			rs = stat.executeQuery();
			
			if (rs.next()) {
				return rs.getString("seq");
			}
			
		} catch (Exception e) {
			
			System.out.println("BoardDAO.getSeq : " + e.toString());
		}
		
		return null;
	}

	public void addHashBoard(String seq, String hseq) {
		
		try {
			
			String sql = "insert into tblHashBoard (seq, pseq, hseq) values (hashboard_seq.nextval, ?, ?)";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			stat.setString(2, hseq);
			
			stat.executeUpdate();
			
		} catch (Exception e) {
			
			System.out.println("BoardDAO.addHashBoard : " + e.toString());
		}
		
	}

	public ArrayList<String> listHash(String seq) {
		
		try {
			
			String sql = "select h.tag from tblBoard b" + 
								"    inner join tblHashBoard hb" + 
								"        on b.seq = hb.pseq" + 
								"            inner join tblHash h" + 
								"                on h.seq = hb.hseq" + 
								"                    where b.seq = ?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			rs = stat.executeQuery();
			
			ArrayList<String> hlist = new ArrayList<String>();
			
			while (rs.next()) {
				hlist.add(rs.getString("tag"));
			}
			
			return hlist;
			
		} catch (Exception e) {
			
			System.out.println("BoardDAO.listHash : " + e.toString());
		}
		
		return null;
	}

	public void delHash(String seq) {
		
		try {
			
			String sql = "delete from tblHashBoard where pseq = ?";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			stat.executeUpdate();
			
		} catch (Exception e) {
			
			System.out.println("BoardDAO.delHash : " + e.toString());
		}
		
	}
	
}
















