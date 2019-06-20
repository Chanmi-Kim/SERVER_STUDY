package com.test.ajax;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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
	
	
	//----------------------------------

	public ArrayList<ZipCodeDTO> search(String search) {
		
		try {
			
			String sql = "select * from zipcode where dong like '%' || ? || '%'";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, search);
			
			rs = stat.executeQuery();
			
			ArrayList<ZipCodeDTO> list = new ArrayList<ZipCodeDTO>();
			
			while (rs.next()) {
				//레코드 1개  -> DTO 1개
				ZipCodeDTO dto = new ZipCodeDTO();
				
				dto.setSido(rs.getString("sido"));
				dto.setGugun(rs.getString("gugun"));
				dto.setDong(rs.getString("dong"));
				dto.setBunji(rs.getString("bunji"));
				dto.setZipcode(rs.getString("zipcode"));
				
				list.add(dto);
			}
			
			return list;			
			
		} catch (Exception e) {
			
			System.out.println("AjaxDAO.search : " + e.toString());
		}
		
		return null;
	}

	public ArrayList<InsaDTO> list(String deparment) {
		
		try {
			
			String sql = "select num, name, jikwi, tel, city from tblInsa"
									+ " where buseo = ?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, deparment);
			
			rs = stat.executeQuery();
			
			ArrayList<InsaDTO> list = new ArrayList<InsaDTO>();
			
			while (rs.next()) {
				
				InsaDTO dto = new InsaDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setJikwi(rs.getString("jikwi"));
				dto.setCity(rs.getString("city"));
				dto.setTel(rs.getString("tel"));
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			
			System.out.println("AjaxDAO.list : " + e.toString());
		}
		
		return null;
	}

	public int setPosition(CatDTO dto) {
		
		try {
			
			String sql = "update tblCat set x = ?, y = ? where catid = ?";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getX());
			stat.setString(2, dto.getY());
			stat.setString(3, dto.getCatid());
			
			return stat.executeUpdate();			
			
		} catch (Exception e) {
			
			System.out.println("AjaxDAO.setPosition : " + e.toString());
		}
		
		return 0;
	}

	public ArrayList<CatDTO> listCat() {
		
		try {
			
			String sql = "select * from tblCat";
			
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery();
			
			ArrayList<CatDTO> list = new ArrayList<CatDTO>();
			
			while (rs.next()) {
				CatDTO dto = new CatDTO();
				dto.setCatid(rs.getString("catid"));
				dto.setX(rs.getString("x"));
				dto.setY(rs.getString("y"));
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			
			System.out.println("AjaxDAO.listCat : " + e.toString());
		}
		
		return null;
	}
	
}











