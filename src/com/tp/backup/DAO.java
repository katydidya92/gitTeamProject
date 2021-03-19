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
		DataSource ds 
		   = (DataSource)initCTX.lookup("java:comp/env/jdbc/tpDB");
		con = ds.getConnection();
		
		System.out.println("DAO : 디비 연결 성공!");
		
		return con;
	}
	
	// 자원해제 
	public void closeDB(){
		try {
			if(rs != null){ rs.close(); }
			if(pstmt != null){ pstmt.close(); }
			if(con != null){ con.close(); }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
