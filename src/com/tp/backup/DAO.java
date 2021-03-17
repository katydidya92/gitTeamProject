package com.tp.backup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DAO {
	private static DAO dao;
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private DAO(){}
	
	public static DAO getInstance() {
		if (dao == null) {
			dao = new DAO();
		}
		return dao;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	
	
}
