package com.tp.bbs.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.tp.bbs.bean.BbsBean;

public class BbsDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	private Connection getCon() throws Exception {
		Context initCTX = new InitialContext();
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/tpDB");
		con = ds.getConnection();

		System.out.println("DAO : 디비 연결 성공!");

		return con;
	}

	// 자원해제
	public void closeDB() {
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 게시판 글 입력
	public void insertBbs(BbsBean bbs) {
		int bbsID = 0;

		try {
			con = getCon();
			sql = "select max(bbsID) from tp_bbs";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			// 있으면 + 1, 없으면 1
			if (rs.next()) {
				bbsID = rs.getInt(1) + 1;
			} else {
				bbsID = 1;
			}

			sql = "insert into tp_bbs(bbsID, bbs_ref, bbs_seq, bbs_lev, bbs_available, bbs_category, bbs_title, bbs_content, bbs_readcount, bbs_date, userID, userNickName, fileID, best, isAdmin, likeID, ip)"
					+ "values(" + "?,?,?,?,?,?,?,?,?,now(),?," + "?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, bbsID);
			pstmt.setInt(2, bbsID); // 번호
			pstmt.setInt(3, 0); // 순서
			pstmt.setInt(4, 0); // 답글 단계
			pstmt.setInt(5, 1); // 사용 : 1 / 안쓰면 0
			pstmt.setInt(6, 0); // 카테고리 - 일단 0
			pstmt.setString(7, bbs.getBbs_title());
			pstmt.setString(8, bbs.getBbs_content());
			pstmt.setInt(9, 0); // 조회수
			pstmt.setString(10, bbs.getUserID()); // user.getUserID()
			pstmt.setString(11, bbs.getUserNickName()); // user.getUserNickName()
			pstmt.setInt(12, 0); // file.getFileID()
			pstmt.setInt(13, 0); // 베스트 : 1 / 일반 : 0
			pstmt.setInt(14, 0); // user.getIsAdmin()
			pstmt.setInt(15, 0); // lk.getLikeID()
			pstmt.setString(16, bbs.getIp());

			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertBbs 메소드 내부에서 오류 : " + e);
		} finally {
			closeDB();
		}
	}// insertBbs()메소드 끝

	// 게시판 리스트 출력
	public List getBbsList(int startRow, int rowSize) {
		List bbsList = new ArrayList();
		try {
			con = getCon();
			sql = "select * from tp_bbs order by bbsID desc limit ?,?";
			// limit offset(시작점), row_count(출력수)
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, rowSize);

			rs = pstmt.executeQuery();
			while (rs.next()) {

				BbsBean bbs = new BbsBean();
				bbs.setBbsID(rs.getInt("bbsID"));
				bbs.setBbs_category(rs.getInt("bbs_category"));
				bbs.setBbs_content(rs.getString("bbs_content"));
				bbs.setBbs_title(rs.getString("bbs_title"));
				bbs.setBbs_date(rs.getTimestamp("bbs_date"));
				bbs.setUserID(rs.getString("userID"));

				bbsList.add(bbs);
			}
		} catch (Exception e) {
			System.out.println("getBbsList 메소드 내부에서 오류 : " + e);
		} finally {
			closeDB();
		}
		return bbsList;
	}// BbsList()메소드 끝

	// 모든 글 개수 가져오기
	public int getBbsCount() {
		int count = 0;
		try {
			con = getCon();
			sql = "select * from tp_bbs";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count++;
			}
			System.out.println("DAO:" + count);
		} catch (Exception e) {
			System.out.println("getAllBbsCount()메소드에서 예외 발생 : " + e);
		} finally {
			closeDB();
		}
		return count;
	}// getBbsCount()메소드 끝

	/////////////////////////////////////

	public List getBoardKeywordList(String keyword, int startNum, int endNum) {
		BbsBean bbs = null;
		String allKeyword = "%" + keyword + "%";
		List bbsList = new ArrayList();

		sql = "";
		
		try {
			con = getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, allKeyword);
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, endNum);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				bbs.setBbsID(rs.getInt("bbsID"));
				bbs.setBbs_title(rs.getString("bbs_title"));
				bbs.setBbs_content(rs.getString("bbs_content"));
				bbs.setUserID(rs.getString("userID"));
				bbsList.add(bbs);
			}
		} catch (Exception ex) {
			System.out.println("오류 발생: " + ex);
		}
		finally {
			closeDB();
		}
		return bbsList;
	}

	public int getTotalKeywordCount(String keyword) {
		BbsBean bbs = null;
		String allKeyword = "%" + keyword + "%";
		int cnt = 0;
		sql = "select count(*) from tp_bbs where tp_title like ?";
		try {
			con = getCon();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, allKeyword);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("오류 발생: " + ex);
		}
		finally {
			closeDB();
		}
		return cnt;
	}

}
