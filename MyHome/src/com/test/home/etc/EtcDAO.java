package com.test.home.etc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.test.home.DBUtil;
import com.test.home.member.MemberDTO;

public class EtcDAO {

	private Connection conn;
	private PreparedStatement stat;
	private ResultSet rs;
	
	public EtcDAO() {
		
		DBUtil util = new DBUtil();
		conn = util.connect();
		
	}

	public ArrayList<ChartDTO> list() {
		
		try {
			
			String sql = "select * from vwChart";
			
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery();
			
			ArrayList<ChartDTO> list = new ArrayList<ChartDTO>();
			
			while (rs.next()) {
				ChartDTO dto = new ChartDTO();
				dto.setMon(rs.getString("mon"));
				dto.setCnt(rs.getString("cnt"));
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			
			System.out.println("EtcDAO.list : " + e.toString());
		}
		
		return null;
	}

	public ArrayList<ArrayList<ChartDTO>> listAll() {
		
		try {
			
			String sql = "select distinct(buseo) as buseo from tblInsa";
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery();
			
			ArrayList<ArrayList<ChartDTO>> list = new ArrayList<ArrayList<ChartDTO>>();//3차원 배열
			
			while (rs.next()) {
			
				/*
				String sql2 = "select to_char(ibsadate, 'mm') as mon, count(*) as cnt " + 
						"    from tblInsa  where buseo = ? " + 
						"        group by to_char(ibsadate, 'mm') " + 
						"            order by to_char(ibsadate, 'mm')";
				*/
				
				String sql2 = "select m.mon, count(num) as cnt, nvl(buseo, ?) as buseo from (select * from tblInsa where buseo = ?) i right outer join tblMonth m on to_char(i.ibsadate, 'mm') = m.mon group by m.mon, i.buseo order by m.mon asc";
				
				PreparedStatement stat2 = conn.prepareStatement(sql2);
				stat2.setString(1, rs.getString("buseo"));
				stat2.setString(2, rs.getString("buseo"));
				ResultSet rs2 = stat2.executeQuery();
				
				ArrayList<ChartDTO> list2 = new ArrayList<ChartDTO>();
				
				while (rs2.next()) {
					ChartDTO dto2 = new ChartDTO();
					
					dto2.setMon(rs2.getString("mon"));
					dto2.setCnt(rs2.getString("cnt"));
					dto2.setBuseo(rs2.getString("buseo"));
					
					list2.add(dto2);
				}
				
				list.add(list2);//2차원 배열 > 3차원 배열
			
			}
			
			return list; //3차원 배열
			
		} catch (Exception e) {
			
			System.out.println("EtcDAO.listAll : " + e.toString());
		}
		
		return null;
	}

	public ArrayList<ChartDTO1> list1() {
		
		try {
			
			String sql = "select (select name from tblMember where id = tblBoard.id) as name, count(*) as cnt from tblBoard group by id";
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery();
			
			ArrayList<ChartDTO1> list1 = new ArrayList<ChartDTO1>();
			
			while (rs.next()) {
				ChartDTO1 dto = new ChartDTO1();
				dto.setName(rs.getString("name"));
				dto.setCnt(rs.getInt("cnt"));
				list1.add(dto);
			}
			
			return list1;
			
		} catch (Exception e) {
			
			System.out.println("EtcDAO.list1 : " + e.toString());
		}
		
		return null;
	}

	public ArrayList<MemberDTO> mlist() {
		
		try {
			
			String sql = "select id, name from tblMember order by name desc";
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery();
			
			ArrayList<MemberDTO> mlist = new ArrayList<MemberDTO>();
			
			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				mlist.add(dto);
			}
			
			return mlist;
			
		} catch (Exception e) {
			
			System.out.println("EtcDAO.mlist : " + e.toString());
		}
		
		return null;
	}

	public ArrayList<ChartDTO2> list2() {
		
		try {
			
			String sql = "select " + 
					"    (select count(*) from tblBoard where id=tblMember.id) as cnt1," + 
					"    (select count(*) from tblComment where id=tblMember.id) as cnt2" + 
					" from tblMember " + 
					"    where id=(select id from (select id from tblMember order by name desc) " + 
					"        where rownum=1)";
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery();
			
			ArrayList<ChartDTO2> list2 = new ArrayList<ChartDTO2>();
			
			while (rs.next()) {
				ChartDTO2 dto = new ChartDTO2();
				dto.setCnt1(rs.getInt("cnt1"));
				dto.setCnt2(rs.getInt("cnt2"));
				list2.add(dto);
			}
			
			return list2;
			
		} catch (Exception e) {
			
			System.out.println("EtcDAO.list2 : " + e.toString());
		}
		
		return null;
	}

	public ChartDTO2 get(String id) {
		
		try {
			
			String sql = "select  (select count(*) from tblBoard where id=tblMember.id) as cnt1,  (select count(*) from tblComment where id=tblMember.id) as cnt2  from tblMember where id=?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, id);
			
			rs = stat.executeQuery();
			
			ChartDTO2 dto = new ChartDTO2();
			
			if (rs.next()) {
				dto.setCnt1(rs.getInt("cnt1"));
				dto.setCnt2(rs.getInt("cnt2"));
			}
			
			return dto;
			
			
		} catch (Exception e) {
			
			System.out.println("EtcDAO.get : " + e.toString());
		}
		
		return null;
	}
	
}















