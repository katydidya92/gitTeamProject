package com.tp.bbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tp.bbs.bean.BbsBean;

public class PageAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("M : PageAddAction_execute() 호출");
		
		// 한글데이터 처리 
		request.setCharacterEncoding("UTF-8");
		
		BbsBean bbs = new BbsBean();
		BbsDAO bdao = new BbsDAO();
		
		bbs.setBbs_title(request.getParameter("bbs_title"));
		bbs.setBbs_content(request.getParameter("bbs_content"));
		bbs.setUserID(request.getParameter("userID"));
		bbs.setUserNickName(request.getParameter("userNickName"));
		bbs.setIp(request.getRemoteAddr());
		
		bdao.insertBbs(bbs);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./Main.pa");
		
		forward.setRedirect(true);
		// true - sendRedirect() 방식으로 이동 (주소,화면 변경O)
		// false - forward() 방식으로 이동 (주소 변경x, 화면 변경 O)
		
		return forward;
	}

}
