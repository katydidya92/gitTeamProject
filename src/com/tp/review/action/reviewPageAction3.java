package com.tp.review.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tp.bbs.bean.BbsBean;
import com.tp.bbs.bean.LikeBean;
import com.tp.bbs.db.FileDAO;
import com.tp.cmt.db.CmtDAO;
import com.tp.like.action.LikeDAO;
import com.tp.users.db.UserBean;
import com.tp.users.db.UserDAO;

public class reviewPageAction3 implements Action {

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

		// 정보저장
		int bbsID = Integer.parseInt(request.getParameter("bbsID"));
		String bbs_pass = request.getParameter("bbs_pass");

		// DAO 생성
		ReDAO rdao = new ReDAO();

		int result = rdao.getbbsPass(bbsID, bbs_pass);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (result == 0) { // 비밀번호 오류
			out.print("<script>");
			out.print("alert('비밀번호를 확인하세요');");
			out.print("history.back();");
			out.print("</script>");

			out.close();
			return null;
		} else {
			BbsBean bbsDetail = rdao.getBbs(bbsID);

			// request영역에 저장
			request.setAttribute("bbsDetail", bbsDetail);

			// 페이지 이동
			forward.setPath("./ReviewPage.ao?bbsID=" + bbsID);
			forward.setRedirect(true);
			return forward;

		}
	}

}
