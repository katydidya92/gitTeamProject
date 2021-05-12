package com.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	// 디비연결 - 커넥션풀
	private Connection getCon() throws Exception {
		Context initCTX = new InitialContext();
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/tpDB");
		con = ds.getConnection();

		System.out.println("DAO : DB 디비 연결 성공! -> " + con);

		return con;
	}

	// 자원해제
	public void closeDB() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("DAO : DB 자원해제 !");
	}

	/************** DB 처리에 대한 Method들 **************/

	// idCheck(email)
	public int confirm(String email) {
		int result = 0;

		if (email == "") {
			result = -1;
		} else {
			// 있으면 1 없으면 0
			try {
				con = getCon();
				sql = "select * from tp_users where userEmail = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, email);
				// sql실행
				rs = pstmt.executeQuery();
				if (rs.next() == true) {
					result = 1;
				} else
					result = 0;
			} catch (SQLException e) {
				System.err.println(" * Error 이유 : Database 구문 오류, " + e.getMessage());
			} catch (Exception e) {
				System.err.println(" * Error 이유 : " + e.getMessage());
			} finally {
				closeDB();
			}
		}

		return result;
	}
	// idCheck(email)

	// getMember(email)
	public MemberBean getMember(String email) {
		MemberBean mb = null;

		try {
			// 1.2. 디비연결
			con = getCon();
			// 3. sql 작성 & pstmt생성
			sql = "select * from tp_users where userEmail=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리
			if (rs.next()) {
				mb = new MemberBean();

				// DB -> MemberBean 저장
				mb.setEmail(rs.getString("userEmail"));
				mb.setPhone(rs.getString("userPhone"));
				mb.setName(rs.getString("userName"));
				mb.setPass(rs.getString("userPass"));
			}

			System.out.println("DAO : 회원 정보 저장 완료  " + mb);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return mb;
	}
	// getMember(email)

	// pnum_check(phone)
	public int pnum_check(String phone) {
		int result = 0;

		if (phone == "") {
			result = -1;
		} else {
			// 있으면 1 없으면 0
			System.out.println(phone);
			try {
				con = getCon();
				sql = "select * from tp_users where userPhone = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, phone);

				// sql실행
				rs = pstmt.executeQuery();
				if (rs.next()) {
					result = 1;
				} else
					result = 0;

				System.out.println(result);

			} catch (SQLException e) {
				System.err.println(" * Error 이유 : Database 구문 오류, " + e.getMessage());
			} catch (Exception e) {
				System.err.println(" * Error 이유 : " + e.getMessage());
			} finally {
				closeDB();
			}
		}

		return result;
	}
	// pnum_check(phone)

	// findEmail
	public String findemail(String name, String phone) {
		System.out.println("DAO : 이름 >> " + name + " | 전화번호 >> " + phone);
		String email = null;
		try {
			sql = "select userEmail from tp_users where userName=? and userPhone=?";
			con = getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				email = rs.getString("userEmail");
			} else {
				email = "회원정보를 확인해주세요";
			}
			System.out.println("DAO : 아이디 찾기 완료!! >> " + email);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return email;
	}

	// findpass
	public String findpass(String email, String phone) {
		System.out.println("DAO : 이름 >> " + email + " | 전화번호 >> " + phone);
		String pass = null;
		try {
			sql = "select userPass from tp_users where userEmail=? and userPhone=?";
			con = getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, phone);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				pass = rs.getString("userPass");
			} else {
				pass = "회원정보를 확인해주세요";
			}
			System.out.println("DAO : 비밀번호 찾기 완료!! >> " + pass);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return pass;
	}

}
