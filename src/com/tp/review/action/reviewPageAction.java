package com.tp.review.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.action.PagingVO;
import com.tp.bbs.bean.BbsBean;
import com.tp.bbs.bean.CmtBean;
import com.tp.bbs.bean.LikeBean;
import com.tp.bbs.db.FileDAO;
import com.tp.cmt.db.CmtDAO;
import com.tp.like.action.LikeDAO;
import com.tp.users.db.UserBean;
import com.tp.users.db.UserDAO;

public class reviewPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("M : reviewPageAction_execute() 호출");

		ActionForward forward = new ActionForward();
		// 세션 제어
		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("userID");
		if (userID == null) {
			forward.setPath("./UserLogin.do");
			forward.setRedirect(true);
		}
		
		UserBean ub = new UserBean();
		UserDAO udao = new UserDAO();
		
		int adminStatus = udao.getUser(userID).getIsAdmin();
		System.out.println("adminStatus" + adminStatus);

		// 정보저장
		int bbsID = Integer.parseInt(request.getParameter("bbsID"));

		// DAO 생성
		ReDAO rdao = new ReDAO();
		rdao.updateReadCount(bbsID);
		BbsBean bbsDetail = rdao.getBbs(bbsID);

		// 파일 처리
		FileDAO fdao = new FileDAO();
		String fileName = fdao.getFile(bbsID);

		// 좋아요 처리
		LikeBean lb = new LikeBean();
		LikeDAO ldao = new LikeDAO();
		lb.setUserID(userID);
		lb.setBbsID(bbsID);
		lb.setBbs_category(bbsDetail.getBbs_category());
		int likeCheck = ldao.likeCheck(userID, bbsID);
		int likeSum = ldao.totalLike(lb);

		// 댓글 처리
		CmtDAO cmtao = new CmtDAO();
		PagingVO pvo = new PagingVO();

		String pageNum = request.getParameter("pageNo");
		if (pageNum == null) {
			pageNum = "1";
		}

		int pageNo = Integer.parseInt(pageNum);

		pvo.setPageNo(pageNo);
		pvo.setTotalCount(cmtao.getCmtCount(bbsID));
		pvo.setShowPageRow(20);
		
		Vector totalList = cmtao.getCmtList(bbsID, pvo);
		List cmtList = (List) totalList.get(0);
		List userList = (List) totalList.get(1);

		List totalReList = cmtao.getReCmtList(bbsID, pvo);
		List cmtReList = (List) totalReList.get(0);
		List userReList = (List) totalReList.get(1);

		System.out.println(userList);
		System.out.println(cmtList);
		// request영역에 저장
		request.setAttribute("bbsDetail", bbsDetail);
		request.setAttribute("fileName", fileName);
		request.setAttribute("likeCheck", likeCheck);
		request.setAttribute("likeSum", likeSum);
		request.setAttribute("cmtList", cmtList);
		request.setAttribute("userList", userList);
		request.setAttribute("cmtReList", cmtReList);
		request.setAttribute("userReList", userReList);
		request.setAttribute("pvo", pvo);
		request.setAttribute("adminStatus", adminStatus);

		// 페이지 이동
		forward.setPath("./review/reviewPage.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
