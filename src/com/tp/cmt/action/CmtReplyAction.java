package com.tp.cmt.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tp.bbs.bean.CmtBean;
import com.tp.cmt.action.Action;
import com.tp.cmt.action.ActionForward;
import com.tp.cmt.db.CmtDAO;

public class CmtReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : CmtReplyAction 호출");
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
		int cmt_seq = Integer.parseInt(request.getParameter("cmt_seq"));
		int cmt_lev = Integer.parseInt(request.getParameter("cmt_lev"));
		int cmt_ref = Integer.parseInt(request.getParameter("cmt_ref"));

		CmtBean cb = new CmtBean();

		cb.setBbsID(bbsID);
		cb.setCmtID(cmtID);
		cb.setUserID(userID);
		cb.setCmt_seq(cmt_seq);
		cb.setCmt_lev(cmt_lev);
		if (cmt_seq != 0) {
			cb.setCmt_ref(cmt_ref);
		} else {
			cb.setCmt_ref(cmtID);
		}
		cb.setCmt_content(request.getParameter("cmt_content"));
		cb.setIp(request.getRemoteAddr());
		
		CmtDAO cmtao = new CmtDAO();
		cmtao.cmtReAdd(cb);

		forward.setPath("ReviewPage.ao?bbsID=" + bbsID);
		forward.setRedirect(true);
		return forward;

	}

}
