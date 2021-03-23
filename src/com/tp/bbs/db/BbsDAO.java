package com.tp.bbs.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BbsDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql ="";
	
//////////////////////////////////////////////////////////	
	// 디비연결
	private Connection getCon() throws Exception{
		Context initCTX = new InitialContext();
		DataSource ds 
		   = (DataSource)initCTX.lookup("java:comp/env/jdbc/tpDB");
		con = ds.getConnection();
		
		System.out.println("DAO : 디비연결 ::::::: "+con);
		
		return con;
	}
//////////////////////////////////////////////////////////	
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
//////////////////////////////////////////////////////////
	//insertBbs(bbs)
	public void insertBbs(BbsBean bbs){
		int bbsID = 0;
		try {
			con = getCon();
			sql="select max(bbsID) from tp.tp_bbs";
			
			pstmt=con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				bbsID = rs.getInt(1)+1;
			}
			
			sql="insert into tp_bbs(bbsID, bbs_category, bbs_title, bbs_content, bbs_date) "
					+ "values(?,?,?,?,now())";
			
			pstmt= con.prepareStatement(sql);
			
			pstmt.setInt(1, bbsID);
			pstmt.setInt(2, bbs.getBbs_category());
			pstmt.setString(3, bbs.getBbs_title());
			pstmt.setString(4, bbs.getBbs_content());
			
			pstmt.executeUpdate();
			
			System.out.println("DAO : 게시글 등록 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}
	
	//insertBbs(bbs)
//////////////////////////////////////////////////////////
	//getBbsList()
	public List<BbsBean> getBbsList(){
		List<BbsBean> bbsList = new ArrayList<BbsBean>();
		
		try {
			con = getCon();
			
			sql="select * from tp_bbs "
					+ "order by BbsID desc";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BbsBean bbs = new BbsBean();
				
				bbs.setBbsID(rs.getInt("bbsID"));
				bbs.setBbs_ref(rs.getInt("bbs_ref"));
				bbs.setBbs_seq(rs.getInt("bbs_seq"));
				bbs.setBbs_lev(rs.getInt("bbs_lev"));
				bbs.setBbs_available(rs.getInt("bbs_available"));
				bbs.setBbs_category(rs.getInt("bbs_category"));
				bbs.setBbs_title(rs.getString("bbs_title"));
				bbs.setBbs_content(rs.getString("bbs_content"));
				bbs.setBbs_readcount(rs.getInt("bbs_readcount"));
				bbs.setBbs_date(rs.getTimestamp("bbs_date"));
				bbs.setUserID(rs.getString("userID"));
				bbs.setUserNickName(rs.getString("userNickName"));
				bbs.setFileID(rs.getInt("fileID"));
				bbs.setBest(rs.getInt("best"));
				bbs.setIsAdmin(rs.getInt("isAdmin"));
				bbs.setLikeID(rs.getInt("likeID"));
				bbs.setIp(rs.getString("ip"));
				
				bbsList.add(bbs);
			}
			
				System.out.println(bbsList);
				System.out.println("DAO : 게시판리스트 학인");
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		 
		return bbsList;
	}
	 
	//getBbsList()
//////////////////////////////////////////////////////////
	//getboardCount()
	public int getboardCount(){
		int cnt = 0;
		try {
			con = getCon();
			sql="select count(BbsID) from tp.tp_bbs";
			
			pstmt= con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				cnt = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	//getboardCount()
//////////////////////////////////////////////////////////
	//getBbs(bbsID)
	public BbsBean getBbs(int bbsID){
		BbsBean bbsb = null;
		
		try {
			con = getCon();
			
			sql="select * from tp.tp_bbs where bbsID=?";
			
			pstmt = con.prepareStatement(sql);
			
			//?
			pstmt.setInt(1, bbsID);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				bbsb = new BbsBean();
				
				bbsb.setBbsID(rs.getInt("bbsID"));
				bbsb.setBbs_ref(rs.getInt("bbs_ref"));
				bbsb.setBbs_seq(rs.getInt("bbs_seq"));
				bbsb.setBbs_lev(rs.getInt("bbs_lev"));
				bbsb.setBbs_available(rs.getInt("bbs_available"));
				bbsb.setBbs_category(rs.getInt("bbs_category"));
				bbsb.setBbs_title(rs.getString("bbs_title"));
				bbsb.setBbs_content(rs.getString("bbs_content"));
				bbsb.setBbs_readcount(rs.getInt("bbs_readcount"));
				bbsb.setBbs_date(rs.getTimestamp("bbs_date"));
				bbsb.setUserID(rs.getString("userID"));
				bbsb.setUserNickName(rs.getString("userNickName"));
				bbsb.setFileID(rs.getInt("fileID"));
				bbsb.setBest(rs.getInt("best"));
				bbsb.setIsAdmin(rs.getInt("isAdmin"));
				bbsb.setLikeID(rs.getInt("likeID"));
				bbsb.setIp(rs.getString("ip"));
				 
			}
			
			System.out.println("DAO : bbsID에 따른 내용 담기 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		
		
		
		return bbsb;
	}
	
	
	
	//getBbs(bbsID)
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
	
}
