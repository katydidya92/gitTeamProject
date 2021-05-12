package com.tp.cmt.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tp.bbs.bean.CmtBean;
import com.tp.cmt.db.CmtDAO;

public class CmtModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("C : CmtModifyAction_execute() 실행");

		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("userID");

		ActionForward forward = new ActionForward();
		if (userID == null) {
			forward.setPath("./UserLogin.do");
			forward.setRedirect(true);
			return forward;
		}
		int bbsID = Integer.parseInt(request.getParameter("bbsID"));
		int cmtID = Integer.parseInt(request.getParameter("cmtID"));
		
		CmtBean cb = new CmtBean();
		CmtDAO cmtao = new CmtDAO();

		cb.setBbsID(bbsID);
		cb.setCmtID(cmtID);
		cb.setUserID(userID);
		cb.setCmt_content(request.getParameter("cmt_content"));
		System.out.println(cb);
		cmtao.modifyCmt(cb);
		

		// 페이지 이동
		forward.setPath("ReviewPage.ao?bbsID=" + bbsID);
		forward.setRedirect(true);
		return forward;
	}
}