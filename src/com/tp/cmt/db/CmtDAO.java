package com.tp.cmt.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.admin.action.PagingVO;
import com.tp.bbs.bean.CmtBean;
import com.tp.users.db.UserBean;

public class CmtDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	// 디비연결 메서드 - 커넥션풀
	private Connection getCon() throws Exception {
		Context initCTX = new InitialContext();
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/tpDB");
		con = ds.getConnection();
		System.out.println("DAO : 디비 연결 성공!");
		return con;
	}

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

	// 댓글 작성 시작
	public void comment(CmtBean cb) {
		int cmtID = 0;
		try {
			con = getCon();
			sql = "select max(cmtID) from tp_cmts";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				cmtID = rs.getInt(1) + 1;
			} else {
				cmtID = 1;
			}

			sql = "insert into tp_cmts(" + "cmtID, userID, cmt_content, bbsID, "
					+ "bbs_category, cmt_ref, cmt_seq, cmt_lev, cmt_date, " + "cmt_available, ip) "
					+ "values(?,?,?,?,?,?,?,?,now(),?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, cmtID);
			pstmt.setString(2, cb.getUserID());
			pstmt.setString(3, cb.getCmt_content());
			pstmt.setInt(4, cb.getBbsID());
			pstmt.setInt(5, 3);
			pstmt.setInt(6, cmtID); // cmt_ref
			pstmt.setInt(7, 0); // cmt_seq
			pstmt.setInt(8, 0); // cmt_lev
			pstmt.setInt(9, 1); // cmt_available
			pstmt.setString(10, cb.getIp());

			pstmt.executeUpdate();
			System.out.println("DAO : 댓글 작성완료! ");

		} catch (Exception e) {
			System.out.println("Cmtcmt()메소드에서 예외 발생 : " + e);
		} finally {
			closeDB();
		}
	}

	// 모든 글 갯수 정보
	public int getCmtCount(int bbsID) {
		int count = 0;
		try {
			con = getCon();
			sql = "select count(*) from tp_cmts where bbsID = ? and cmt_available = 1";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bbsID);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
			System.out.println(" 댓글 갯수 조회 " + count);

		} catch (Exception e) {
			System.out.println("getCmtCount()메소드에서 예외 발생 : " + e);
		} finally {
			closeDB();
		}
		return count;
	}

	// getcmt = cmt가져오기 시작
	public CmtBean getcmt(int cmtID) {
		CmtBean cb = null;
		try {
			con = getCon();
			sql = "select * from tp_cmts where cmtID=? and cmt_available = 1";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, cmtID);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				cb = new CmtBean();

				cb.setCmtID(rs.getInt("cmtID"));
				cb.setUserID(rs.getString("userID"));
				cb.setCmt_content(rs.getString("cmt_content"));
				cb.setBbsID(rs.getInt("bbsID"));
				cb.setBbs_category(rs.getInt("bbs_category"));
				cb.setCmt_seq(rs.getInt("cmt_ref"));
				cb.setCmt_seq(rs.getInt("cmt_seq"));
				cb.setCmt_lev(rs.getInt("cmt_lev"));
				cb.setCmt_date(rs.getTimestamp("cmt_date"));
				cb.setCmt_available(rs.getInt("cmt_available"));
				cb.setIp(rs.getString("ip"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return cb;
	}

	// 댓글 리스트 시작
	public Vector getCmtList(int bbsID, PagingVO pvo) {
		Vector totalList = new Vector();
		List cmtList = new ArrayList();
		List userList = new ArrayList();
		StringBuffer SQL = new StringBuffer();
		try {
			con = getCon();
			SQL.append("select ct.*, us.userNickName ");
			SQL.append("from tp_cmts ct inner join tp_users us ");
			SQL.append("on ct.userID = us.userID ");
			SQL.append("where ct.cmt_available=1 and ct.bbsID = ? and ct.cmt_lev = 0 ");
			SQL.append("order by ct.cmtID desc limit ?,? ");

			pstmt = con.prepareStatement(SQL.toString());

			pstmt.setInt(1, bbsID);
			pstmt.setInt(2, pvo.getStartRow());
			pstmt.setInt(3, pvo.getShowPageRow());

			rs = pstmt.executeQuery();
			while (rs.next()) {
				CmtBean cmt = new CmtBean();
				UserBean ub = new UserBean();

				cmt.setCmtID(rs.getInt("cmtID"));
				cmt.setUserID(rs.getString("userID"));
				cmt.setCmt_content(rs.getString("cmt_content"));
				cmt.setBbsID(rs.getInt("bbsID"));
				cmt.setBbs_category(rs.getInt("bbs_category"));
				cmt.setCmt_ref(rs.getInt("cmt_ref"));
				cmt.setCmt_seq(rs.getInt("cmt_seq"));
				cmt.setCmt_lev(rs.getInt("cmt_lev"));
				cmt.setCmt_date(rs.getTimestamp("cmt_date"));
				cmt.setCmt_available(rs.getInt("cmt_available"));
				cmt.setIp(rs.getString("ip"));
				cmtList.add(cmt);

				ub.setUserNickName(rs.getString("userNickName"));
				userList.add(ub);

			} // while문 끝
			totalList.add(cmtList);
			totalList.add(userList);
			System.out.println(" 댓글 리스트 확인! ");

		} catch (Exception e) {
			System.out.println("getCmtList 메소드 내부에서 오류 : " + e);
		} finally {
			closeDB();
		}
		return totalList;
	}

	// 대댓글 리스트 시작
	public List getReCmtList(int bbsID, PagingVO pvo) {
		List totalList = new Vector();
		List cmtList = new ArrayList();
		List userList = new ArrayList();
		StringBuffer SQL = new StringBuffer();

		try {
			con = getCon();
			SQL.append("select ct.*, us.userNickName ");
			SQL.append("from tp_cmts ct inner join tp_users us ");
			SQL.append("on ct.userID = us.userID ");
			SQL.append("where ct.cmt_available=1 and ct.bbsID = ? and ct.cmt_seq > 0 ");
			SQL.append("order by ct.cmt_ref desc, ct.cmt_seq limit ?,? ");

			pstmt = con.prepareStatement(SQL.toString());

			pstmt.setInt(1, bbsID);
			pstmt.setInt(2, pvo.getStartRow());
			pstmt.setInt(3, pvo.getShowPageRow());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CmtBean cmt = new CmtBean();
				UserBean ub = new UserBean();

				cmt.setCmtID(rs.getInt("cmtID"));
				cmt.setUserID(rs.getString("userID"));
				cmt.setCmt_content(rs.getString("cmt_content"));
				cmt.setBbsID(rs.getInt("bbsID"));
				cmt.setBbs_category(rs.getInt("bbs_category"));
				cmt.setCmt_ref(rs.getInt("cmt_ref"));
				cmt.setCmt_seq(rs.getInt("cmt_seq"));
				cmt.setCmt_lev(rs.getInt("cmt_lev"));
				cmt.setCmt_date(rs.getTimestamp("cmt_date"));
				cmt.setCmt_available(rs.getInt("cmt_available"));
				cmt.setIp(rs.getString("ip"));
				cmtList.add(cmt);

				ub.setUserNickName(rs.getString("userNickName"));
				userList.add(ub);

			} // while문 끝
			totalList.add(cmtList);
			totalList.add(userList);
			System.out.println(" 대댓글 리스트 확인! ");

		} catch (Exception e) {
			System.out.println("getCmtList2 메소드 내부에서 오류 : " + e);
		} finally {
			closeDB();
		}
		return totalList;
	}

	// 댓글 삭제
	public int deleteCmt(CmtBean cmt, UserBean ub) {
		int result = -1;
		StringBuffer SQL = new StringBuffer();

		try {
			con = getCon();
			sql = "select * from tp_cmts where cmtID=?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, cmt.getCmtID());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				SQL.append("update tp_cmts set cmt_available=0 ");
				if (ub.getUserID().equals(rs.getString("userID")) && cmt.getCmtID() == rs.getInt("cmt_ref")) {
					SQL.append("where cmt_ref=?");
				} else if (ub.getUserID().equals(rs.getString("userID")) && cmt.getCmtID() != rs.getInt("cmt_ref")) {
					SQL.append("where cmtID=?");
				} else if (ub.getIsAdmin() == 1 && cmt.getCmtID() == rs.getInt("cmt_ref")) {
					SQL.append("where cmt_ref=?");
				} else if (ub.getIsAdmin() == 1 && cmt.getCmtID() != rs.getInt("cmt_ref")) {
					SQL.append("where cmtID=?");
				} else {
					SQL.append("where cmtID=?");
				}

				pstmt = con.prepareStatement(SQL.toString());

				if (ub.getUserID().equals(rs.getString("userID")) && cmt.getCmtID() == rs.getInt("cmt_ref")) {
					pstmt.setInt(1, cmt.getCmtID());
					pstmt.executeUpdate();
					result = 1;
				} else if (ub.getUserID().equals(rs.getString("userID")) && cmt.getCmtID() != rs.getInt("cmt_ref")) {
					pstmt.setInt(1, cmt.getCmtID());
					pstmt.executeUpdate();
					result = 1;
				} else if (ub.getIsAdmin() == 1 && cmt.getCmtID() == rs.getInt("cmt_ref")) {
					pstmt.setInt(1, cmt.getCmtID());
					pstmt.executeUpdate();
					result = 1;
				} else if (ub.getIsAdmin() == 1 && cmt.getCmtID() != rs.getInt("cmt_ref")) {
					pstmt.setInt(1, cmt.getCmtID());
					pstmt.executeUpdate();
					result = 1;
				} else {
					pstmt.setInt(1, cmt.getCmtID());
					pstmt.executeUpdate();
					result = 0;
				}
			} else {
				result = -1;
			}
		} catch (Exception e) {
			System.out.println("deleteCmt()메소드에서 예외 발생 : " + e);
		} finally {
			closeDB();
		}
		return result;
	}

	// 댓글 수정 시작
	public int modifyCmt(CmtBean cb) {
		int check = -1;
		try {
			con = getCon();
			sql = "select userID from tp_cmts where cmtID=?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, cb.getCmtID());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (cb.getUserID().equals(rs.getString("userID"))) {

					sql = "update tp_cmts set cmt_content = ? where cmtID = ?";

					pstmt = con.prepareStatement(sql);

					pstmt.setString(1, cb.getCmt_content());
					pstmt.setInt(2, cb.getCmtID());

					check = pstmt.executeUpdate();
				}
			} else {
				check = -1;
			}
			System.out.println("DAO : 댓글 수정 완료 >> " + check);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return check;
	}

	// 댓글 수정 시작
	public int modifyReCmt(CmtBean cb) {
		int check = -1;
		try {
			con = getCon();
			sql = "select userID from tp_cmts where cmtID=?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, cb.getCmtID());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (cb.getUserID().equals(rs.getString("userID"))) {

					sql = "update tp_cmts set cmt_content = ? where cmtID = ?";

					pstmt = con.prepareStatement(sql);

					pstmt.setString(1, cb.getCmt_content());
					pstmt.setInt(2, cb.getCmtID());

					check = pstmt.executeUpdate();
				}
			} else {
				check = -1;
			}
			System.out.println("DAO : 댓글 수정 완료 >> " + check);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return check;
	}

	//////////////////////////////////////////////////////////////////////////////////////
	public void cmtReAdd(CmtBean cb) {

		System.out.println("CDAO : 댓글추가 시작");

		int cmtID = 0;

		try {
			con = getCon();
			sql = "select max(cmtID) from tp_cmts";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cmtID = rs.getInt(1) + 1;
			}
			System.out.println("대댓글번호 : " + cmtID);

			System.out.println("CDAO : 대댓 넣기 시작 ");

			sql = "insert into tp_cmts values(?,?,?,?,?,?,?,?,now(),?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, cmtID);
			pstmt.setString(2, cb.getUserID());
			pstmt.setString(3, cb.getCmt_content());
			pstmt.setInt(4, cb.getBbsID());
			pstmt.setInt(5, 3);
			pstmt.setInt(6, cb.getCmt_ref());
			pstmt.setInt(7, cb.getCmt_seq() + 1);
			pstmt.setInt(8, 1); // lev
			pstmt.setInt(9, 1);
			pstmt.setString(10, cb.getIp());

			pstmt.executeUpdate();

			System.out.println("CDAO : 대댓 완료");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

	}

}
