package com.test.home.etc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.test.home.DBUtil;

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
	
}















