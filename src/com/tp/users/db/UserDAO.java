package com.tp.users.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
	
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
				
		// 디비연결- 커넥션풀 
		private Connection getCon() throws Exception {
			Context initCTX = new InitialContext();
			DataSource ds = (DataSource)initCTX.lookup("java:comp/env/jdbc/tpDB");
			con = ds.getConnection();
			
			System.out.println("DAO : 디비 연결 성공! -> "+con);
			
			return con;
		}
		
		// 자원해제 
		public void closeDB(){
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			} catch(SQLException e){
				e.printStackTrace();
			}
		}
		
		//insertUser(ub)
		public void insertUser(UserBean ub){
			try {
				con = getCon();
				sql="insert into tp_users(userID,userPass,userName,userEmail,userAddr,"
						+ "userPhone,userProfile,userNickName,reg_date,isAdmin) "
						+ "values(?,?,?,?,?,?,?,?,?,?)";
												// reg_date는 받아 오는 방식 보다는 now 라는 함수를 사용하는 건 어떨까요?
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, ub.getUserID());
				pstmt.setString(2, ub.getUserPass());
				pstmt.setString(3, ub.getUserName());
				pstmt.setString(4, ub.getUserEmail());
				pstmt.setString(5, ub.getUserAddr());
				pstmt.setString(6, ub.getUserPhone());
				pstmt.setString(7, ub.getUserProfile());
				pstmt.setString(8, ub.getUserNickName());
				pstmt.setTimestamp(9, ub.getReg_date());
				pstmt.setInt(10, ub.getIsAdmin());
				
				pstmt.executeUpdate();
				
				System.out.println("DAO : 회원가입 완료!");
				
			} catch (Exception e) {
				System.out.println("DAO : 회원가입 실패!");
				e.printStackTrace();
			} finally{
				closeDB();
			}
			
		}

		// duplicateIdCheck(id)
		public int duplicateIdCheck(String id){
			int result = -1;
			try {
				con = getCon();
				
				/*StringBuffer query = new StringBuffer();
				query.append("select userID from tp_users where userID=?");
				pstmt = con.prepareStatement(query.toString());*/
				
				sql = "select userID from tp_users where userID=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					result = 0; //사용불가
				} else {
					result = 1; //사용가능
				}
				System.out.println("아이디 중복체크 결과 : "+result);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return result;
		}
		
		// duplicateEmailCheck(userEmail)
		public int duplicateEmailCheck(String userEmail){
			int result = -1;
			try {
				con = getCon();
			
				sql = "select userEmail from tp_users where userEmail=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, userEmail);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					result = 0; //사용불가
				} else {
					result = 1; //사용가능
				}
				System.out.println("이메일 중복체크 결과 : " + result);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return result;
		} 
		
		// duplicateNickCheck(userNickName)
		public int duplicateNickCheck(String userNickName){
			int result = -1;
			try {
				con = getCon();
			
				sql = "select userNickName from tp_users where userNickName=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, userNickName);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					result = 0; //사용불가
				} else {
					result = 1; //사용가능
				}
				System.out.println("닉네임 중복체크 결과 : "+ result);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return result;
		} 
		
		//loginCheck(ub)
		public int loginCheck(UserBean ub){
			int result = -1;
			try {
				con = getCon();
				
				sql = "select userPass from tp_users where userID=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, ub.getUserID());
				
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					if(ub.getUserPass().equals(rs.getString("userPass"))){
						result = 1; //로그인
					} else {
						result = 0; //비밀번호 오류
					}
				} else {
					result = -1; //비회원
				}
				System.out.println("DAO : 로그인 체크 " + result);
			} catch (Exception e) {
				e.printStackTrace();
			} finally{
				closeDB();
			}
			return result;
		}
		
}

