package com.tp.backup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql ="";
	
	private Connection getCon() throws Exception{
		Context initCTX = new InitialContext();
		DataSource ds = (DataSource)initCTX.lookup("java:comp/env/jdbc/tpDB");
		con = ds.getConnection();
		
		System.out.println("DAO : 디비 연결 성공!");
		
		return con;
	}
	
	// 자원해제 
	public void closeDB(){
		if(con != null){try{con.close();}catch(SQLException e){e.printStackTrace();}}
		if(rs != null){try{rs.close();}catch(SQLException e){e.printStackTrace();}}
		if(pstmt != null){try{pstmt.close();}catch(SQLException e){e.printStackTrace();}}
	}
	
	public int ex(){
		
		try {
			con = getCon();
			sql = "";
			
			pstmt = con.prepareStatement(sql);
			
			// ? 갯수만큼 작성
			// pstmt.setInt(1, 1);
			
			// pstmt.executeQuery() // pstmt.executeUpdate()
			// select - executeQuery()
			// update / insert / delete - executeUpdate()
			
			// rs = pstmt.executeQuery();
			// rs는 결과 정보가 필요할 때 사용
			// if(rs.next) - 검색 결과가 하나만 나오는 경우
			// while(rs.next) - 검색 결과가 여러 줄 나오는 경우
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		// void 형태가 아닌 경우에 해당하는 데이터 타입 출력
		return 1;
	}
	
}
